import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:totem/core/location/models/nominatim_result.dart';

class NominatimService {
  final Dio _dio;
  final Logger _logger;
  DateTime? _lastRequestTime;

  static const _baseUrl = 'https://nominatim.openstreetmap.org';
  static const _userAgent = 'Totem/0.1.0 (dev.cuervolu.totem)';
  static const _minRequestInterval = Duration(seconds: 1);

  NominatimService({required Logger logger, Dio? dio})
    : _logger = logger,
      _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: _baseUrl,
              headers: {'User-Agent': _userAgent},
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          );

  Future<void> _enforceRateLimit() async {
    if (_lastRequestTime != null) {
      final elapsed = DateTime.now().difference(_lastRequestTime!);
      if (elapsed < _minRequestInterval) {
        final waitTime = _minRequestInterval - elapsed;
        _logger.d('Rate limit: waiting ${waitTime.inMilliseconds}ms');
        await Future.delayed(waitTime);
      }
    }
    _lastRequestTime = DateTime.now();
  }

  Future<List<NominatimResult>> searchAddress(String query) async {
    if (query.trim().isEmpty) return [];

    try {
      await _enforceRateLimit();

      _logger.d('Searching address: $query');

      final response = await _dio.get(
        '/search',
        queryParameters: {
          'q': query,
          'format': 'json',
          'addressdetails': '1',
          'limit': '5',
        },
      );

      if (response.statusCode == 200 && response.data is List) {
        final results = (response.data as List)
            .map((json) => NominatimResult.fromJson(json))
            .toList();

        _logger.d('Found ${results.length} results');
        return results;
      }

      return [];
    } on DioException catch (e) {
      _logger.e('Nominatim search error: ${e.message}');
      rethrow;
    }
  }

  Future<String?> reverseGeocode(double lat, double lon) async {
    try {
      await _enforceRateLimit();

      _logger.d('Reverse geocoding: $lat, $lon');

      final response = await _dio.get(
        '/reverse',
        queryParameters: {
          'lat': lat.toString(),
          'lon': lon.toString(),
          'format': 'json',
          'addressdetails': '1',
        },
      );

      if (response.statusCode == 200 && response.data is Map) {
        final displayName = response.data['display_name'] as String?;
        _logger.d('Reverse geocode result: $displayName');
        return displayName;
      }

      return null;
    } on DioException catch (e) {
      _logger.e('Reverse geocode error: ${e.message}');
      return null;
    }
  }
}
