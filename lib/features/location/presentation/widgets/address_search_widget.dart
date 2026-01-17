import 'dart:async';
import 'package:flutter/material.dart';
import 'package:totem/core/di/injection.dart';
import 'package:totem/core/location/models/location_data.dart';
import 'package:totem/core/location/models/nominatim_result.dart';
import 'package:totem/core/location/services/nominatim_service.dart';
import 'package:totem/core/services/preferences_service.dart';
import 'package:logger/logger.dart';

class AddressSearchWidget extends StatefulWidget {
  final void Function(LocationData) onLocationSelected;

  const AddressSearchWidget({super.key, required this.onLocationSelected});

  @override
  State<AddressSearchWidget> createState() => _AddressSearchWidgetState();
}

class _AddressSearchWidgetState extends State<AddressSearchWidget> {
  final _controller = TextEditingController();
  final _nominatim = getIt<NominatimService>();
  final _prefs = getIt<PreferencesService>();
  final _logger = getIt<Logger>();

  Timer? _debounce;
  List<NominatimResult> _results = [];
  bool _isLoading = false;
  String? _error;

  static const _debounceDuration = Duration(milliseconds: 500);

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    _debounce?.cancel();

    if (query.trim().isEmpty) {
      setState(() {
        _results = [];
        _error = null;
      });
      return;
    }

    _debounce = Timer(_debounceDuration, () => _performSearch(query));
  }

  Future<void> _performSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = null;
    });

    try {
      final cached = _prefs.getCachedNominatimSearch(trimmed);
      if (cached != null) {
        _logger.d('Using cached results for: $trimmed');
        setState(() {
          _results = cached;
          _isLoading = false;
        });
        return;
      }

      _logger.d('Searching: $trimmed');
      final results = await _nominatim.searchAddress(trimmed);

      if (results.isNotEmpty) {
        await _prefs.cacheNominatimSearch(trimmed, results);
      }

      if (mounted) {
        setState(() {
          _results = results;
          _isLoading = false;
        });
      }
    } catch (e) {
      _logger.e('Search error: $e');
      if (mounted) {
        setState(() {
          _error = 'Error al buscar';
          _isLoading = false;
        });
      }
    }
  }

  void _onResultTapped(NominatimResult result) {
    final location = LocationData(
      latitude: result.lat,
      longitude: result.lon,
      displayAddress: result.displayName,
      timestamp: DateTime.now(),
    );

    widget.onLocationSelected(location);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _controller,
          onChanged: _onSearchChanged,
          decoration: InputDecoration(
            hintText: 'Buscar dirección...',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: _controller.text.isNotEmpty
                ? IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      _controller.clear();
                      setState(() {
                        _results = [];
                        _error = null;
                      });
                    },
                  )
                : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
        const SizedBox(height: 16),
        if (_isLoading) ...[
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: CircularProgressIndicator(),
            ),
          ),
        ] else if (_error != null) ...[
          Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              _error!,
              style: TextStyle(color: theme.colorScheme.error),
              textAlign: TextAlign.center,
            ),
          ),
        ] else if (_results.isEmpty && _controller.text.trim().isNotEmpty) ...[
          const Padding(
            padding: EdgeInsets.all(24),
            child: Text(
              'No se encontraron resultados',
              textAlign: TextAlign.center,
            ),
          ),
        ] else if (_results.isNotEmpty) ...[
          Expanded(
            child: ListView.builder(
              itemCount: _results.length,
              itemBuilder: (context, index) {
                final result = _results[index];
                return ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: theme.colorScheme.primary,
                  ),
                  title: Text(
                    result.displayName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  onTap: () => _onResultTapped(result),
                );
              },
            ),
          ),
        ],
      ],
    );
  }
}
