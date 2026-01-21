// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $WeatherCacheTable extends WeatherCache
    with TableInfo<$WeatherCacheTable, WeatherCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _currentTempMeta = const VerificationMeta(
    'currentTemp',
  );
  @override
  late final GeneratedColumn<double> currentTemp = GeneratedColumn<double>(
    'current_temp',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _feelsLikeMeta = const VerificationMeta(
    'feelsLike',
  );
  @override
  late final GeneratedColumn<double> feelsLike = GeneratedColumn<double>(
    'feels_like',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherCodeMeta = const VerificationMeta(
    'weatherCode',
  );
  @override
  late final GeneratedColumn<int> weatherCode = GeneratedColumn<int>(
    'weather_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _humidityMeta = const VerificationMeta(
    'humidity',
  );
  @override
  late final GeneratedColumn<int> humidity = GeneratedColumn<int>(
    'humidity',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _windSpeedMeta = const VerificationMeta(
    'windSpeed',
  );
  @override
  late final GeneratedColumn<int> windSpeed = GeneratedColumn<int>(
    'wind_speed',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uvIndexMeta = const VerificationMeta(
    'uvIndex',
  );
  @override
  late final GeneratedColumn<int> uvIndex = GeneratedColumn<int>(
    'uv_index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _airQualityMeta = const VerificationMeta(
    'airQuality',
  );
  @override
  late final GeneratedColumn<int> airQuality = GeneratedColumn<int>(
    'air_quality',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _expiresAtMeta = const VerificationMeta(
    'expiresAt',
  );
  @override
  late final GeneratedColumn<DateTime> expiresAt = GeneratedColumn<DateTime>(
    'expires_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    currentTemp,
    feelsLike,
    weatherCode,
    condition,
    humidity,
    windSpeed,
    uvIndex,
    airQuality,
    cachedAt,
    expiresAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('current_temp')) {
      context.handle(
        _currentTempMeta,
        currentTemp.isAcceptableOrUnknown(
          data['current_temp']!,
          _currentTempMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentTempMeta);
    }
    if (data.containsKey('feels_like')) {
      context.handle(
        _feelsLikeMeta,
        feelsLike.isAcceptableOrUnknown(data['feels_like']!, _feelsLikeMeta),
      );
    } else if (isInserting) {
      context.missing(_feelsLikeMeta);
    }
    if (data.containsKey('weather_code')) {
      context.handle(
        _weatherCodeMeta,
        weatherCode.isAcceptableOrUnknown(
          data['weather_code']!,
          _weatherCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherCodeMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('humidity')) {
      context.handle(
        _humidityMeta,
        humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta),
      );
    } else if (isInserting) {
      context.missing(_humidityMeta);
    }
    if (data.containsKey('wind_speed')) {
      context.handle(
        _windSpeedMeta,
        windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta),
      );
    }
    if (data.containsKey('uv_index')) {
      context.handle(
        _uvIndexMeta,
        uvIndex.isAcceptableOrUnknown(data['uv_index']!, _uvIndexMeta),
      );
    }
    if (data.containsKey('air_quality')) {
      context.handle(
        _airQualityMeta,
        airQuality.isAcceptableOrUnknown(data['air_quality']!, _airQualityMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    if (data.containsKey('expires_at')) {
      context.handle(
        _expiresAtMeta,
        expiresAt.isAcceptableOrUnknown(data['expires_at']!, _expiresAtMeta),
      );
    } else if (isInserting) {
      context.missing(_expiresAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      currentTemp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}current_temp'],
      )!,
      feelsLike: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}feels_like'],
      )!,
      weatherCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weather_code'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      humidity: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}humidity'],
      )!,
      windSpeed: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}wind_speed'],
      ),
      uvIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}uv_index'],
      ),
      airQuality: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}air_quality'],
      ),
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
      expiresAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}expires_at'],
      )!,
    );
  }

  @override
  $WeatherCacheTable createAlias(String alias) {
    return $WeatherCacheTable(attachedDatabase, alias);
  }
}

class WeatherCacheData extends DataClass
    implements Insertable<WeatherCacheData> {
  final int id;
  final double currentTemp;
  final double feelsLike;
  final int weatherCode;
  final String condition;
  final int humidity;
  final int? windSpeed;
  final int? uvIndex;
  final int? airQuality;
  final DateTime cachedAt;
  final DateTime expiresAt;
  const WeatherCacheData({
    required this.id,
    required this.currentTemp,
    required this.feelsLike,
    required this.weatherCode,
    required this.condition,
    required this.humidity,
    this.windSpeed,
    this.uvIndex,
    this.airQuality,
    required this.cachedAt,
    required this.expiresAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['current_temp'] = Variable<double>(currentTemp);
    map['feels_like'] = Variable<double>(feelsLike);
    map['weather_code'] = Variable<int>(weatherCode);
    map['condition'] = Variable<String>(condition);
    map['humidity'] = Variable<int>(humidity);
    if (!nullToAbsent || windSpeed != null) {
      map['wind_speed'] = Variable<int>(windSpeed);
    }
    if (!nullToAbsent || uvIndex != null) {
      map['uv_index'] = Variable<int>(uvIndex);
    }
    if (!nullToAbsent || airQuality != null) {
      map['air_quality'] = Variable<int>(airQuality);
    }
    map['cached_at'] = Variable<DateTime>(cachedAt);
    map['expires_at'] = Variable<DateTime>(expiresAt);
    return map;
  }

  WeatherCacheCompanion toCompanion(bool nullToAbsent) {
    return WeatherCacheCompanion(
      id: Value(id),
      currentTemp: Value(currentTemp),
      feelsLike: Value(feelsLike),
      weatherCode: Value(weatherCode),
      condition: Value(condition),
      humidity: Value(humidity),
      windSpeed: windSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(windSpeed),
      uvIndex: uvIndex == null && nullToAbsent
          ? const Value.absent()
          : Value(uvIndex),
      airQuality: airQuality == null && nullToAbsent
          ? const Value.absent()
          : Value(airQuality),
      cachedAt: Value(cachedAt),
      expiresAt: Value(expiresAt),
    );
  }

  factory WeatherCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherCacheData(
      id: serializer.fromJson<int>(json['id']),
      currentTemp: serializer.fromJson<double>(json['currentTemp']),
      feelsLike: serializer.fromJson<double>(json['feelsLike']),
      weatherCode: serializer.fromJson<int>(json['weatherCode']),
      condition: serializer.fromJson<String>(json['condition']),
      humidity: serializer.fromJson<int>(json['humidity']),
      windSpeed: serializer.fromJson<int?>(json['windSpeed']),
      uvIndex: serializer.fromJson<int?>(json['uvIndex']),
      airQuality: serializer.fromJson<int?>(json['airQuality']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
      expiresAt: serializer.fromJson<DateTime>(json['expiresAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'currentTemp': serializer.toJson<double>(currentTemp),
      'feelsLike': serializer.toJson<double>(feelsLike),
      'weatherCode': serializer.toJson<int>(weatherCode),
      'condition': serializer.toJson<String>(condition),
      'humidity': serializer.toJson<int>(humidity),
      'windSpeed': serializer.toJson<int?>(windSpeed),
      'uvIndex': serializer.toJson<int?>(uvIndex),
      'airQuality': serializer.toJson<int?>(airQuality),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
      'expiresAt': serializer.toJson<DateTime>(expiresAt),
    };
  }

  WeatherCacheData copyWith({
    int? id,
    double? currentTemp,
    double? feelsLike,
    int? weatherCode,
    String? condition,
    int? humidity,
    Value<int?> windSpeed = const Value.absent(),
    Value<int?> uvIndex = const Value.absent(),
    Value<int?> airQuality = const Value.absent(),
    DateTime? cachedAt,
    DateTime? expiresAt,
  }) => WeatherCacheData(
    id: id ?? this.id,
    currentTemp: currentTemp ?? this.currentTemp,
    feelsLike: feelsLike ?? this.feelsLike,
    weatherCode: weatherCode ?? this.weatherCode,
    condition: condition ?? this.condition,
    humidity: humidity ?? this.humidity,
    windSpeed: windSpeed.present ? windSpeed.value : this.windSpeed,
    uvIndex: uvIndex.present ? uvIndex.value : this.uvIndex,
    airQuality: airQuality.present ? airQuality.value : this.airQuality,
    cachedAt: cachedAt ?? this.cachedAt,
    expiresAt: expiresAt ?? this.expiresAt,
  );
  WeatherCacheData copyWithCompanion(WeatherCacheCompanion data) {
    return WeatherCacheData(
      id: data.id.present ? data.id.value : this.id,
      currentTemp: data.currentTemp.present
          ? data.currentTemp.value
          : this.currentTemp,
      feelsLike: data.feelsLike.present ? data.feelsLike.value : this.feelsLike,
      weatherCode: data.weatherCode.present
          ? data.weatherCode.value
          : this.weatherCode,
      condition: data.condition.present ? data.condition.value : this.condition,
      humidity: data.humidity.present ? data.humidity.value : this.humidity,
      windSpeed: data.windSpeed.present ? data.windSpeed.value : this.windSpeed,
      uvIndex: data.uvIndex.present ? data.uvIndex.value : this.uvIndex,
      airQuality: data.airQuality.present
          ? data.airQuality.value
          : this.airQuality,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
      expiresAt: data.expiresAt.present ? data.expiresAt.value : this.expiresAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherCacheData(')
          ..write('id: $id, ')
          ..write('currentTemp: $currentTemp, ')
          ..write('feelsLike: $feelsLike, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('condition: $condition, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('uvIndex: $uvIndex, ')
          ..write('airQuality: $airQuality, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    currentTemp,
    feelsLike,
    weatherCode,
    condition,
    humidity,
    windSpeed,
    uvIndex,
    airQuality,
    cachedAt,
    expiresAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherCacheData &&
          other.id == this.id &&
          other.currentTemp == this.currentTemp &&
          other.feelsLike == this.feelsLike &&
          other.weatherCode == this.weatherCode &&
          other.condition == this.condition &&
          other.humidity == this.humidity &&
          other.windSpeed == this.windSpeed &&
          other.uvIndex == this.uvIndex &&
          other.airQuality == this.airQuality &&
          other.cachedAt == this.cachedAt &&
          other.expiresAt == this.expiresAt);
}

class WeatherCacheCompanion extends UpdateCompanion<WeatherCacheData> {
  final Value<int> id;
  final Value<double> currentTemp;
  final Value<double> feelsLike;
  final Value<int> weatherCode;
  final Value<String> condition;
  final Value<int> humidity;
  final Value<int?> windSpeed;
  final Value<int?> uvIndex;
  final Value<int?> airQuality;
  final Value<DateTime> cachedAt;
  final Value<DateTime> expiresAt;
  const WeatherCacheCompanion({
    this.id = const Value.absent(),
    this.currentTemp = const Value.absent(),
    this.feelsLike = const Value.absent(),
    this.weatherCode = const Value.absent(),
    this.condition = const Value.absent(),
    this.humidity = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.uvIndex = const Value.absent(),
    this.airQuality = const Value.absent(),
    this.cachedAt = const Value.absent(),
    this.expiresAt = const Value.absent(),
  });
  WeatherCacheCompanion.insert({
    this.id = const Value.absent(),
    required double currentTemp,
    required double feelsLike,
    required int weatherCode,
    required String condition,
    required int humidity,
    this.windSpeed = const Value.absent(),
    this.uvIndex = const Value.absent(),
    this.airQuality = const Value.absent(),
    required DateTime cachedAt,
    required DateTime expiresAt,
  }) : currentTemp = Value(currentTemp),
       feelsLike = Value(feelsLike),
       weatherCode = Value(weatherCode),
       condition = Value(condition),
       humidity = Value(humidity),
       cachedAt = Value(cachedAt),
       expiresAt = Value(expiresAt);
  static Insertable<WeatherCacheData> custom({
    Expression<int>? id,
    Expression<double>? currentTemp,
    Expression<double>? feelsLike,
    Expression<int>? weatherCode,
    Expression<String>? condition,
    Expression<int>? humidity,
    Expression<int>? windSpeed,
    Expression<int>? uvIndex,
    Expression<int>? airQuality,
    Expression<DateTime>? cachedAt,
    Expression<DateTime>? expiresAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (currentTemp != null) 'current_temp': currentTemp,
      if (feelsLike != null) 'feels_like': feelsLike,
      if (weatherCode != null) 'weather_code': weatherCode,
      if (condition != null) 'condition': condition,
      if (humidity != null) 'humidity': humidity,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (uvIndex != null) 'uv_index': uvIndex,
      if (airQuality != null) 'air_quality': airQuality,
      if (cachedAt != null) 'cached_at': cachedAt,
      if (expiresAt != null) 'expires_at': expiresAt,
    });
  }

  WeatherCacheCompanion copyWith({
    Value<int>? id,
    Value<double>? currentTemp,
    Value<double>? feelsLike,
    Value<int>? weatherCode,
    Value<String>? condition,
    Value<int>? humidity,
    Value<int?>? windSpeed,
    Value<int?>? uvIndex,
    Value<int?>? airQuality,
    Value<DateTime>? cachedAt,
    Value<DateTime>? expiresAt,
  }) {
    return WeatherCacheCompanion(
      id: id ?? this.id,
      currentTemp: currentTemp ?? this.currentTemp,
      feelsLike: feelsLike ?? this.feelsLike,
      weatherCode: weatherCode ?? this.weatherCode,
      condition: condition ?? this.condition,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      uvIndex: uvIndex ?? this.uvIndex,
      airQuality: airQuality ?? this.airQuality,
      cachedAt: cachedAt ?? this.cachedAt,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (currentTemp.present) {
      map['current_temp'] = Variable<double>(currentTemp.value);
    }
    if (feelsLike.present) {
      map['feels_like'] = Variable<double>(feelsLike.value);
    }
    if (weatherCode.present) {
      map['weather_code'] = Variable<int>(weatherCode.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<int>(humidity.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<int>(windSpeed.value);
    }
    if (uvIndex.present) {
      map['uv_index'] = Variable<int>(uvIndex.value);
    }
    if (airQuality.present) {
      map['air_quality'] = Variable<int>(airQuality.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    if (expiresAt.present) {
      map['expires_at'] = Variable<DateTime>(expiresAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherCacheCompanion(')
          ..write('id: $id, ')
          ..write('currentTemp: $currentTemp, ')
          ..write('feelsLike: $feelsLike, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('condition: $condition, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('uvIndex: $uvIndex, ')
          ..write('airQuality: $airQuality, ')
          ..write('cachedAt: $cachedAt, ')
          ..write('expiresAt: $expiresAt')
          ..write(')'))
        .toString();
  }
}

class $WeatherForecastTable extends WeatherForecast
    with TableInfo<$WeatherForecastTable, WeatherForecastData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherForecastTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _forecastTimeMeta = const VerificationMeta(
    'forecastTime',
  );
  @override
  late final GeneratedColumn<DateTime> forecastTime = GeneratedColumn<DateTime>(
    'forecast_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tempMeta = const VerificationMeta('temp');
  @override
  late final GeneratedColumn<double> temp = GeneratedColumn<double>(
    'temp',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _weatherCodeMeta = const VerificationMeta(
    'weatherCode',
  );
  @override
  late final GeneratedColumn<int> weatherCode = GeneratedColumn<int>(
    'weather_code',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conditionMeta = const VerificationMeta(
    'condition',
  );
  @override
  late final GeneratedColumn<String> condition = GeneratedColumn<String>(
    'condition',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precipitationProbMeta = const VerificationMeta(
    'precipitationProb',
  );
  @override
  late final GeneratedColumn<int> precipitationProb = GeneratedColumn<int>(
    'precipitation_prob',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    forecastTime,
    temp,
    weatherCode,
    condition,
    precipitationProb,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_forecast';
  @override
  VerificationContext validateIntegrity(
    Insertable<WeatherForecastData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('forecast_time')) {
      context.handle(
        _forecastTimeMeta,
        forecastTime.isAcceptableOrUnknown(
          data['forecast_time']!,
          _forecastTimeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_forecastTimeMeta);
    }
    if (data.containsKey('temp')) {
      context.handle(
        _tempMeta,
        temp.isAcceptableOrUnknown(data['temp']!, _tempMeta),
      );
    } else if (isInserting) {
      context.missing(_tempMeta);
    }
    if (data.containsKey('weather_code')) {
      context.handle(
        _weatherCodeMeta,
        weatherCode.isAcceptableOrUnknown(
          data['weather_code']!,
          _weatherCodeMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_weatherCodeMeta);
    }
    if (data.containsKey('condition')) {
      context.handle(
        _conditionMeta,
        condition.isAcceptableOrUnknown(data['condition']!, _conditionMeta),
      );
    } else if (isInserting) {
      context.missing(_conditionMeta);
    }
    if (data.containsKey('precipitation_prob')) {
      context.handle(
        _precipitationProbMeta,
        precipitationProb.isAcceptableOrUnknown(
          data['precipitation_prob']!,
          _precipitationProbMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_precipitationProbMeta);
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherForecastData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherForecastData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      forecastTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}forecast_time'],
      )!,
      temp: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}temp'],
      )!,
      weatherCode: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}weather_code'],
      )!,
      condition: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}condition'],
      )!,
      precipitationProb: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}precipitation_prob'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $WeatherForecastTable createAlias(String alias) {
    return $WeatherForecastTable(attachedDatabase, alias);
  }
}

class WeatherForecastData extends DataClass
    implements Insertable<WeatherForecastData> {
  final int id;
  final DateTime forecastTime;
  final double temp;
  final int weatherCode;
  final String condition;
  final int precipitationProb;
  final DateTime cachedAt;
  const WeatherForecastData({
    required this.id,
    required this.forecastTime,
    required this.temp,
    required this.weatherCode,
    required this.condition,
    required this.precipitationProb,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['forecast_time'] = Variable<DateTime>(forecastTime);
    map['temp'] = Variable<double>(temp);
    map['weather_code'] = Variable<int>(weatherCode);
    map['condition'] = Variable<String>(condition);
    map['precipitation_prob'] = Variable<int>(precipitationProb);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  WeatherForecastCompanion toCompanion(bool nullToAbsent) {
    return WeatherForecastCompanion(
      id: Value(id),
      forecastTime: Value(forecastTime),
      temp: Value(temp),
      weatherCode: Value(weatherCode),
      condition: Value(condition),
      precipitationProb: Value(precipitationProb),
      cachedAt: Value(cachedAt),
    );
  }

  factory WeatherForecastData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherForecastData(
      id: serializer.fromJson<int>(json['id']),
      forecastTime: serializer.fromJson<DateTime>(json['forecastTime']),
      temp: serializer.fromJson<double>(json['temp']),
      weatherCode: serializer.fromJson<int>(json['weatherCode']),
      condition: serializer.fromJson<String>(json['condition']),
      precipitationProb: serializer.fromJson<int>(json['precipitationProb']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'forecastTime': serializer.toJson<DateTime>(forecastTime),
      'temp': serializer.toJson<double>(temp),
      'weatherCode': serializer.toJson<int>(weatherCode),
      'condition': serializer.toJson<String>(condition),
      'precipitationProb': serializer.toJson<int>(precipitationProb),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  WeatherForecastData copyWith({
    int? id,
    DateTime? forecastTime,
    double? temp,
    int? weatherCode,
    String? condition,
    int? precipitationProb,
    DateTime? cachedAt,
  }) => WeatherForecastData(
    id: id ?? this.id,
    forecastTime: forecastTime ?? this.forecastTime,
    temp: temp ?? this.temp,
    weatherCode: weatherCode ?? this.weatherCode,
    condition: condition ?? this.condition,
    precipitationProb: precipitationProb ?? this.precipitationProb,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  WeatherForecastData copyWithCompanion(WeatherForecastCompanion data) {
    return WeatherForecastData(
      id: data.id.present ? data.id.value : this.id,
      forecastTime: data.forecastTime.present
          ? data.forecastTime.value
          : this.forecastTime,
      temp: data.temp.present ? data.temp.value : this.temp,
      weatherCode: data.weatherCode.present
          ? data.weatherCode.value
          : this.weatherCode,
      condition: data.condition.present ? data.condition.value : this.condition,
      precipitationProb: data.precipitationProb.present
          ? data.precipitationProb.value
          : this.precipitationProb,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('WeatherForecastData(')
          ..write('id: $id, ')
          ..write('forecastTime: $forecastTime, ')
          ..write('temp: $temp, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('condition: $condition, ')
          ..write('precipitationProb: $precipitationProb, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    forecastTime,
    temp,
    weatherCode,
    condition,
    precipitationProb,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherForecastData &&
          other.id == this.id &&
          other.forecastTime == this.forecastTime &&
          other.temp == this.temp &&
          other.weatherCode == this.weatherCode &&
          other.condition == this.condition &&
          other.precipitationProb == this.precipitationProb &&
          other.cachedAt == this.cachedAt);
}

class WeatherForecastCompanion extends UpdateCompanion<WeatherForecastData> {
  final Value<int> id;
  final Value<DateTime> forecastTime;
  final Value<double> temp;
  final Value<int> weatherCode;
  final Value<String> condition;
  final Value<int> precipitationProb;
  final Value<DateTime> cachedAt;
  const WeatherForecastCompanion({
    this.id = const Value.absent(),
    this.forecastTime = const Value.absent(),
    this.temp = const Value.absent(),
    this.weatherCode = const Value.absent(),
    this.condition = const Value.absent(),
    this.precipitationProb = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  WeatherForecastCompanion.insert({
    this.id = const Value.absent(),
    required DateTime forecastTime,
    required double temp,
    required int weatherCode,
    required String condition,
    required int precipitationProb,
    required DateTime cachedAt,
  }) : forecastTime = Value(forecastTime),
       temp = Value(temp),
       weatherCode = Value(weatherCode),
       condition = Value(condition),
       precipitationProb = Value(precipitationProb),
       cachedAt = Value(cachedAt);
  static Insertable<WeatherForecastData> custom({
    Expression<int>? id,
    Expression<DateTime>? forecastTime,
    Expression<double>? temp,
    Expression<int>? weatherCode,
    Expression<String>? condition,
    Expression<int>? precipitationProb,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (forecastTime != null) 'forecast_time': forecastTime,
      if (temp != null) 'temp': temp,
      if (weatherCode != null) 'weather_code': weatherCode,
      if (condition != null) 'condition': condition,
      if (precipitationProb != null) 'precipitation_prob': precipitationProb,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  WeatherForecastCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? forecastTime,
    Value<double>? temp,
    Value<int>? weatherCode,
    Value<String>? condition,
    Value<int>? precipitationProb,
    Value<DateTime>? cachedAt,
  }) {
    return WeatherForecastCompanion(
      id: id ?? this.id,
      forecastTime: forecastTime ?? this.forecastTime,
      temp: temp ?? this.temp,
      weatherCode: weatherCode ?? this.weatherCode,
      condition: condition ?? this.condition,
      precipitationProb: precipitationProb ?? this.precipitationProb,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (forecastTime.present) {
      map['forecast_time'] = Variable<DateTime>(forecastTime.value);
    }
    if (temp.present) {
      map['temp'] = Variable<double>(temp.value);
    }
    if (weatherCode.present) {
      map['weather_code'] = Variable<int>(weatherCode.value);
    }
    if (condition.present) {
      map['condition'] = Variable<String>(condition.value);
    }
    if (precipitationProb.present) {
      map['precipitation_prob'] = Variable<int>(precipitationProb.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherForecastCompanion(')
          ..write('id: $id, ')
          ..write('forecastTime: $forecastTime, ')
          ..write('temp: $temp, ')
          ..write('weatherCode: $weatherCode, ')
          ..write('condition: $condition, ')
          ..write('precipitationProb: $precipitationProb, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $RssFeedItemsTable extends RssFeedItems
    with TableInfo<$RssFeedItemsTable, RssFeedItem> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RssFeedItemsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _feedSourceMeta = const VerificationMeta(
    'feedSource',
  );
  @override
  late final GeneratedColumn<String> feedSource = GeneratedColumn<String>(
    'feed_source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _linkMeta = const VerificationMeta('link');
  @override
  late final GeneratedColumn<String> link = GeneratedColumn<String>(
    'link',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _publishedAtMeta = const VerificationMeta(
    'publishedAt',
  );
  @override
  late final GeneratedColumn<DateTime> publishedAt = GeneratedColumn<DateTime>(
    'published_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isReadMeta = const VerificationMeta('isRead');
  @override
  late final GeneratedColumn<bool> isRead = GeneratedColumn<bool>(
    'is_read',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_read" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _cachedAtMeta = const VerificationMeta(
    'cachedAt',
  );
  @override
  late final GeneratedColumn<DateTime> cachedAt = GeneratedColumn<DateTime>(
    'cached_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    feedSource,
    title,
    link,
    summary,
    imageUrl,
    publishedAt,
    isRead,
    cachedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rss_feed_items';
  @override
  VerificationContext validateIntegrity(
    Insertable<RssFeedItem> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('feed_source')) {
      context.handle(
        _feedSourceMeta,
        feedSource.isAcceptableOrUnknown(data['feed_source']!, _feedSourceMeta),
      );
    } else if (isInserting) {
      context.missing(_feedSourceMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('link')) {
      context.handle(
        _linkMeta,
        link.isAcceptableOrUnknown(data['link']!, _linkMeta),
      );
    } else if (isInserting) {
      context.missing(_linkMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    if (data.containsKey('published_at')) {
      context.handle(
        _publishedAtMeta,
        publishedAt.isAcceptableOrUnknown(
          data['published_at']!,
          _publishedAtMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_publishedAtMeta);
    }
    if (data.containsKey('is_read')) {
      context.handle(
        _isReadMeta,
        isRead.isAcceptableOrUnknown(data['is_read']!, _isReadMeta),
      );
    }
    if (data.containsKey('cached_at')) {
      context.handle(
        _cachedAtMeta,
        cachedAt.isAcceptableOrUnknown(data['cached_at']!, _cachedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_cachedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {feedSource, link},
  ];
  @override
  RssFeedItem map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RssFeedItem(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      feedSource: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}feed_source'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      link: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}link'],
      )!,
      summary: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}summary'],
      ),
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      ),
      publishedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}published_at'],
      )!,
      isRead: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_read'],
      )!,
      cachedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}cached_at'],
      )!,
    );
  }

  @override
  $RssFeedItemsTable createAlias(String alias) {
    return $RssFeedItemsTable(attachedDatabase, alias);
  }
}

class RssFeedItem extends DataClass implements Insertable<RssFeedItem> {
  final int id;
  final String feedSource;
  final String title;
  final String link;
  final String? summary;
  final String? imageUrl;
  final DateTime publishedAt;
  final bool isRead;
  final DateTime cachedAt;
  const RssFeedItem({
    required this.id,
    required this.feedSource,
    required this.title,
    required this.link,
    this.summary,
    this.imageUrl,
    required this.publishedAt,
    required this.isRead,
    required this.cachedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['feed_source'] = Variable<String>(feedSource);
    map['title'] = Variable<String>(title);
    map['link'] = Variable<String>(link);
    if (!nullToAbsent || summary != null) {
      map['summary'] = Variable<String>(summary);
    }
    if (!nullToAbsent || imageUrl != null) {
      map['image_url'] = Variable<String>(imageUrl);
    }
    map['published_at'] = Variable<DateTime>(publishedAt);
    map['is_read'] = Variable<bool>(isRead);
    map['cached_at'] = Variable<DateTime>(cachedAt);
    return map;
  }

  RssFeedItemsCompanion toCompanion(bool nullToAbsent) {
    return RssFeedItemsCompanion(
      id: Value(id),
      feedSource: Value(feedSource),
      title: Value(title),
      link: Value(link),
      summary: summary == null && nullToAbsent
          ? const Value.absent()
          : Value(summary),
      imageUrl: imageUrl == null && nullToAbsent
          ? const Value.absent()
          : Value(imageUrl),
      publishedAt: Value(publishedAt),
      isRead: Value(isRead),
      cachedAt: Value(cachedAt),
    );
  }

  factory RssFeedItem.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RssFeedItem(
      id: serializer.fromJson<int>(json['id']),
      feedSource: serializer.fromJson<String>(json['feedSource']),
      title: serializer.fromJson<String>(json['title']),
      link: serializer.fromJson<String>(json['link']),
      summary: serializer.fromJson<String?>(json['summary']),
      imageUrl: serializer.fromJson<String?>(json['imageUrl']),
      publishedAt: serializer.fromJson<DateTime>(json['publishedAt']),
      isRead: serializer.fromJson<bool>(json['isRead']),
      cachedAt: serializer.fromJson<DateTime>(json['cachedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'feedSource': serializer.toJson<String>(feedSource),
      'title': serializer.toJson<String>(title),
      'link': serializer.toJson<String>(link),
      'summary': serializer.toJson<String?>(summary),
      'imageUrl': serializer.toJson<String?>(imageUrl),
      'publishedAt': serializer.toJson<DateTime>(publishedAt),
      'isRead': serializer.toJson<bool>(isRead),
      'cachedAt': serializer.toJson<DateTime>(cachedAt),
    };
  }

  RssFeedItem copyWith({
    int? id,
    String? feedSource,
    String? title,
    String? link,
    Value<String?> summary = const Value.absent(),
    Value<String?> imageUrl = const Value.absent(),
    DateTime? publishedAt,
    bool? isRead,
    DateTime? cachedAt,
  }) => RssFeedItem(
    id: id ?? this.id,
    feedSource: feedSource ?? this.feedSource,
    title: title ?? this.title,
    link: link ?? this.link,
    summary: summary.present ? summary.value : this.summary,
    imageUrl: imageUrl.present ? imageUrl.value : this.imageUrl,
    publishedAt: publishedAt ?? this.publishedAt,
    isRead: isRead ?? this.isRead,
    cachedAt: cachedAt ?? this.cachedAt,
  );
  RssFeedItem copyWithCompanion(RssFeedItemsCompanion data) {
    return RssFeedItem(
      id: data.id.present ? data.id.value : this.id,
      feedSource: data.feedSource.present
          ? data.feedSource.value
          : this.feedSource,
      title: data.title.present ? data.title.value : this.title,
      link: data.link.present ? data.link.value : this.link,
      summary: data.summary.present ? data.summary.value : this.summary,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      publishedAt: data.publishedAt.present
          ? data.publishedAt.value
          : this.publishedAt,
      isRead: data.isRead.present ? data.isRead.value : this.isRead,
      cachedAt: data.cachedAt.present ? data.cachedAt.value : this.cachedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RssFeedItem(')
          ..write('id: $id, ')
          ..write('feedSource: $feedSource, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('summary: $summary, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isRead: $isRead, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    feedSource,
    title,
    link,
    summary,
    imageUrl,
    publishedAt,
    isRead,
    cachedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RssFeedItem &&
          other.id == this.id &&
          other.feedSource == this.feedSource &&
          other.title == this.title &&
          other.link == this.link &&
          other.summary == this.summary &&
          other.imageUrl == this.imageUrl &&
          other.publishedAt == this.publishedAt &&
          other.isRead == this.isRead &&
          other.cachedAt == this.cachedAt);
}

class RssFeedItemsCompanion extends UpdateCompanion<RssFeedItem> {
  final Value<int> id;
  final Value<String> feedSource;
  final Value<String> title;
  final Value<String> link;
  final Value<String?> summary;
  final Value<String?> imageUrl;
  final Value<DateTime> publishedAt;
  final Value<bool> isRead;
  final Value<DateTime> cachedAt;
  const RssFeedItemsCompanion({
    this.id = const Value.absent(),
    this.feedSource = const Value.absent(),
    this.title = const Value.absent(),
    this.link = const Value.absent(),
    this.summary = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.publishedAt = const Value.absent(),
    this.isRead = const Value.absent(),
    this.cachedAt = const Value.absent(),
  });
  RssFeedItemsCompanion.insert({
    this.id = const Value.absent(),
    required String feedSource,
    required String title,
    required String link,
    this.summary = const Value.absent(),
    this.imageUrl = const Value.absent(),
    required DateTime publishedAt,
    this.isRead = const Value.absent(),
    required DateTime cachedAt,
  }) : feedSource = Value(feedSource),
       title = Value(title),
       link = Value(link),
       publishedAt = Value(publishedAt),
       cachedAt = Value(cachedAt);
  static Insertable<RssFeedItem> custom({
    Expression<int>? id,
    Expression<String>? feedSource,
    Expression<String>? title,
    Expression<String>? link,
    Expression<String>? summary,
    Expression<String>? imageUrl,
    Expression<DateTime>? publishedAt,
    Expression<bool>? isRead,
    Expression<DateTime>? cachedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (feedSource != null) 'feed_source': feedSource,
      if (title != null) 'title': title,
      if (link != null) 'link': link,
      if (summary != null) 'summary': summary,
      if (imageUrl != null) 'image_url': imageUrl,
      if (publishedAt != null) 'published_at': publishedAt,
      if (isRead != null) 'is_read': isRead,
      if (cachedAt != null) 'cached_at': cachedAt,
    });
  }

  RssFeedItemsCompanion copyWith({
    Value<int>? id,
    Value<String>? feedSource,
    Value<String>? title,
    Value<String>? link,
    Value<String?>? summary,
    Value<String?>? imageUrl,
    Value<DateTime>? publishedAt,
    Value<bool>? isRead,
    Value<DateTime>? cachedAt,
  }) {
    return RssFeedItemsCompanion(
      id: id ?? this.id,
      feedSource: feedSource ?? this.feedSource,
      title: title ?? this.title,
      link: link ?? this.link,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
      publishedAt: publishedAt ?? this.publishedAt,
      isRead: isRead ?? this.isRead,
      cachedAt: cachedAt ?? this.cachedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (feedSource.present) {
      map['feed_source'] = Variable<String>(feedSource.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (link.present) {
      map['link'] = Variable<String>(link.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (publishedAt.present) {
      map['published_at'] = Variable<DateTime>(publishedAt.value);
    }
    if (isRead.present) {
      map['is_read'] = Variable<bool>(isRead.value);
    }
    if (cachedAt.present) {
      map['cached_at'] = Variable<DateTime>(cachedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RssFeedItemsCompanion(')
          ..write('id: $id, ')
          ..write('feedSource: $feedSource, ')
          ..write('title: $title, ')
          ..write('link: $link, ')
          ..write('summary: $summary, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('publishedAt: $publishedAt, ')
          ..write('isRead: $isRead, ')
          ..write('cachedAt: $cachedAt')
          ..write(')'))
        .toString();
  }
}

class $CalendarEventsTable extends CalendarEvents
    with TableInfo<$CalendarEventsTable, CalendarEvent> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarEventsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _externalIdMeta = const VerificationMeta(
    'externalId',
  );
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
    'external_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
    'color',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _syncedAtMeta = const VerificationMeta(
    'syncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> syncedAt = GeneratedColumn<DateTime>(
    'synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    externalId,
    title,
    startTime,
    endTime,
    description,
    location,
    color,
    source,
    syncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'calendar_events';
  @override
  VerificationContext validateIntegrity(
    Insertable<CalendarEvent> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('external_id')) {
      context.handle(
        _externalIdMeta,
        externalId.isAcceptableOrUnknown(data['external_id']!, _externalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_startTimeMeta);
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    } else if (isInserting) {
      context.missing(_endTimeMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    }
    if (data.containsKey('color')) {
      context.handle(
        _colorMeta,
        color.isAcceptableOrUnknown(data['color']!, _colorMeta),
      );
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('synced_at')) {
      context.handle(
        _syncedAtMeta,
        syncedAt.isAcceptableOrUnknown(data['synced_at']!, _syncedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_syncedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {source, externalId},
  ];
  @override
  CalendarEvent map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CalendarEvent(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      externalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      )!,
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      location: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}location'],
      ),
      color: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color'],
      ),
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      syncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}synced_at'],
      )!,
    );
  }

  @override
  $CalendarEventsTable createAlias(String alias) {
    return $CalendarEventsTable(attachedDatabase, alias);
  }
}

class CalendarEvent extends DataClass implements Insertable<CalendarEvent> {
  final int id;
  final String externalId;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  final String? description;
  final String? location;
  final int? color;
  final String source;
  final DateTime syncedAt;
  const CalendarEvent({
    required this.id,
    required this.externalId,
    required this.title,
    required this.startTime,
    required this.endTime,
    this.description,
    this.location,
    this.color,
    required this.source,
    required this.syncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['external_id'] = Variable<String>(externalId);
    map['title'] = Variable<String>(title);
    map['start_time'] = Variable<DateTime>(startTime);
    map['end_time'] = Variable<DateTime>(endTime);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || location != null) {
      map['location'] = Variable<String>(location);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    map['source'] = Variable<String>(source);
    map['synced_at'] = Variable<DateTime>(syncedAt);
    return map;
  }

  CalendarEventsCompanion toCompanion(bool nullToAbsent) {
    return CalendarEventsCompanion(
      id: Value(id),
      externalId: Value(externalId),
      title: Value(title),
      startTime: Value(startTime),
      endTime: Value(endTime),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      location: location == null && nullToAbsent
          ? const Value.absent()
          : Value(location),
      color: color == null && nullToAbsent
          ? const Value.absent()
          : Value(color),
      source: Value(source),
      syncedAt: Value(syncedAt),
    );
  }

  factory CalendarEvent.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarEvent(
      id: serializer.fromJson<int>(json['id']),
      externalId: serializer.fromJson<String>(json['externalId']),
      title: serializer.fromJson<String>(json['title']),
      startTime: serializer.fromJson<DateTime>(json['startTime']),
      endTime: serializer.fromJson<DateTime>(json['endTime']),
      description: serializer.fromJson<String?>(json['description']),
      location: serializer.fromJson<String?>(json['location']),
      color: serializer.fromJson<int?>(json['color']),
      source: serializer.fromJson<String>(json['source']),
      syncedAt: serializer.fromJson<DateTime>(json['syncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'externalId': serializer.toJson<String>(externalId),
      'title': serializer.toJson<String>(title),
      'startTime': serializer.toJson<DateTime>(startTime),
      'endTime': serializer.toJson<DateTime>(endTime),
      'description': serializer.toJson<String?>(description),
      'location': serializer.toJson<String?>(location),
      'color': serializer.toJson<int?>(color),
      'source': serializer.toJson<String>(source),
      'syncedAt': serializer.toJson<DateTime>(syncedAt),
    };
  }

  CalendarEvent copyWith({
    int? id,
    String? externalId,
    String? title,
    DateTime? startTime,
    DateTime? endTime,
    Value<String?> description = const Value.absent(),
    Value<String?> location = const Value.absent(),
    Value<int?> color = const Value.absent(),
    String? source,
    DateTime? syncedAt,
  }) => CalendarEvent(
    id: id ?? this.id,
    externalId: externalId ?? this.externalId,
    title: title ?? this.title,
    startTime: startTime ?? this.startTime,
    endTime: endTime ?? this.endTime,
    description: description.present ? description.value : this.description,
    location: location.present ? location.value : this.location,
    color: color.present ? color.value : this.color,
    source: source ?? this.source,
    syncedAt: syncedAt ?? this.syncedAt,
  );
  CalendarEvent copyWithCompanion(CalendarEventsCompanion data) {
    return CalendarEvent(
      id: data.id.present ? data.id.value : this.id,
      externalId: data.externalId.present
          ? data.externalId.value
          : this.externalId,
      title: data.title.present ? data.title.value : this.title,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      description: data.description.present
          ? data.description.value
          : this.description,
      location: data.location.present ? data.location.value : this.location,
      color: data.color.present ? data.color.value : this.color,
      source: data.source.present ? data.source.value : this.source,
      syncedAt: data.syncedAt.present ? data.syncedAt.value : this.syncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEvent(')
          ..write('id: $id, ')
          ..write('externalId: $externalId, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('color: $color, ')
          ..write('source: $source, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    externalId,
    title,
    startTime,
    endTime,
    description,
    location,
    color,
    source,
    syncedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarEvent &&
          other.id == this.id &&
          other.externalId == this.externalId &&
          other.title == this.title &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.description == this.description &&
          other.location == this.location &&
          other.color == this.color &&
          other.source == this.source &&
          other.syncedAt == this.syncedAt);
}

class CalendarEventsCompanion extends UpdateCompanion<CalendarEvent> {
  final Value<int> id;
  final Value<String> externalId;
  final Value<String> title;
  final Value<DateTime> startTime;
  final Value<DateTime> endTime;
  final Value<String?> description;
  final Value<String?> location;
  final Value<int?> color;
  final Value<String> source;
  final Value<DateTime> syncedAt;
  const CalendarEventsCompanion({
    this.id = const Value.absent(),
    this.externalId = const Value.absent(),
    this.title = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.color = const Value.absent(),
    this.source = const Value.absent(),
    this.syncedAt = const Value.absent(),
  });
  CalendarEventsCompanion.insert({
    this.id = const Value.absent(),
    required String externalId,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
    this.description = const Value.absent(),
    this.location = const Value.absent(),
    this.color = const Value.absent(),
    required String source,
    required DateTime syncedAt,
  }) : externalId = Value(externalId),
       title = Value(title),
       startTime = Value(startTime),
       endTime = Value(endTime),
       source = Value(source),
       syncedAt = Value(syncedAt);
  static Insertable<CalendarEvent> custom({
    Expression<int>? id,
    Expression<String>? externalId,
    Expression<String>? title,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<String>? description,
    Expression<String>? location,
    Expression<int>? color,
    Expression<String>? source,
    Expression<DateTime>? syncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (externalId != null) 'external_id': externalId,
      if (title != null) 'title': title,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (description != null) 'description': description,
      if (location != null) 'location': location,
      if (color != null) 'color': color,
      if (source != null) 'source': source,
      if (syncedAt != null) 'synced_at': syncedAt,
    });
  }

  CalendarEventsCompanion copyWith({
    Value<int>? id,
    Value<String>? externalId,
    Value<String>? title,
    Value<DateTime>? startTime,
    Value<DateTime>? endTime,
    Value<String?>? description,
    Value<String?>? location,
    Value<int?>? color,
    Value<String>? source,
    Value<DateTime>? syncedAt,
  }) {
    return CalendarEventsCompanion(
      id: id ?? this.id,
      externalId: externalId ?? this.externalId,
      title: title ?? this.title,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      description: description ?? this.description,
      location: location ?? this.location,
      color: color ?? this.color,
      source: source ?? this.source,
      syncedAt: syncedAt ?? this.syncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (syncedAt.present) {
      map['synced_at'] = Variable<DateTime>(syncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarEventsCompanion(')
          ..write('id: $id, ')
          ..write('externalId: $externalId, ')
          ..write('title: $title, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('description: $description, ')
          ..write('location: $location, ')
          ..write('color: $color, ')
          ..write('source: $source, ')
          ..write('syncedAt: $syncedAt')
          ..write(')'))
        .toString();
  }
}

class $MascotProfileTable extends MascotProfile
    with TableInfo<$MascotProfileTable, MascotProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MascotProfileTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _birthDateMeta = const VerificationMeta(
    'birthDate',
  );
  @override
  late final GeneratedColumn<DateTime> birthDate = GeneratedColumn<DateTime>(
    'birth_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, birthDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'mascot_profile';
  @override
  VerificationContext validateIntegrity(
    Insertable<MascotProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('birth_date')) {
      context.handle(
        _birthDateMeta,
        birthDate.isAcceptableOrUnknown(data['birth_date']!, _birthDateMeta),
      );
    } else if (isInserting) {
      context.missing(_birthDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MascotProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MascotProfileData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      birthDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}birth_date'],
      )!,
    );
  }

  @override
  $MascotProfileTable createAlias(String alias) {
    return $MascotProfileTable(attachedDatabase, alias);
  }
}

class MascotProfileData extends DataClass
    implements Insertable<MascotProfileData> {
  final int id;
  final String name;
  final DateTime birthDate;
  const MascotProfileData({
    required this.id,
    required this.name,
    required this.birthDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['birth_date'] = Variable<DateTime>(birthDate);
    return map;
  }

  MascotProfileCompanion toCompanion(bool nullToAbsent) {
    return MascotProfileCompanion(
      id: Value(id),
      name: Value(name),
      birthDate: Value(birthDate),
    );
  }

  factory MascotProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MascotProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      birthDate: serializer.fromJson<DateTime>(json['birthDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'birthDate': serializer.toJson<DateTime>(birthDate),
    };
  }

  MascotProfileData copyWith({int? id, String? name, DateTime? birthDate}) =>
      MascotProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        birthDate: birthDate ?? this.birthDate,
      );
  MascotProfileData copyWithCompanion(MascotProfileCompanion data) {
    return MascotProfileData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      birthDate: data.birthDate.present ? data.birthDate.value : this.birthDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MascotProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, birthDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MascotProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.birthDate == this.birthDate);
}

class MascotProfileCompanion extends UpdateCompanion<MascotProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> birthDate;
  const MascotProfileCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.birthDate = const Value.absent(),
  });
  MascotProfileCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime birthDate,
  }) : name = Value(name),
       birthDate = Value(birthDate);
  static Insertable<MascotProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? birthDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (birthDate != null) 'birth_date': birthDate,
    });
  }

  MascotProfileCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? birthDate,
  }) {
    return MascotProfileCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      birthDate: birthDate ?? this.birthDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (birthDate.present) {
      map['birth_date'] = Variable<DateTime>(birthDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MascotProfileCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('birthDate: $birthDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$TotemDatabase extends GeneratedDatabase {
  _$TotemDatabase(QueryExecutor e) : super(e);
  $TotemDatabaseManager get managers => $TotemDatabaseManager(this);
  late final $WeatherCacheTable weatherCache = $WeatherCacheTable(this);
  late final $WeatherForecastTable weatherForecast = $WeatherForecastTable(
    this,
  );
  late final $RssFeedItemsTable rssFeedItems = $RssFeedItemsTable(this);
  late final $CalendarEventsTable calendarEvents = $CalendarEventsTable(this);
  late final $MascotProfileTable mascotProfile = $MascotProfileTable(this);
  late final WeatherDao weatherDao = WeatherDao(this as TotemDatabase);
  late final RssDao rssDao = RssDao(this as TotemDatabase);
  late final CalendarDao calendarDao = CalendarDao(this as TotemDatabase);
  late final MascotDao mascotDao = MascotDao(this as TotemDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    weatherCache,
    weatherForecast,
    rssFeedItems,
    calendarEvents,
    mascotProfile,
  ];
}

typedef $$WeatherCacheTableCreateCompanionBuilder =
    WeatherCacheCompanion Function({
      Value<int> id,
      required double currentTemp,
      required double feelsLike,
      required int weatherCode,
      required String condition,
      required int humidity,
      Value<int?> windSpeed,
      Value<int?> uvIndex,
      Value<int?> airQuality,
      required DateTime cachedAt,
      required DateTime expiresAt,
    });
typedef $$WeatherCacheTableUpdateCompanionBuilder =
    WeatherCacheCompanion Function({
      Value<int> id,
      Value<double> currentTemp,
      Value<double> feelsLike,
      Value<int> weatherCode,
      Value<String> condition,
      Value<int> humidity,
      Value<int?> windSpeed,
      Value<int?> uvIndex,
      Value<int?> airQuality,
      Value<DateTime> cachedAt,
      Value<DateTime> expiresAt,
    });

class $$WeatherCacheTableFilterComposer
    extends Composer<_$TotemDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get currentTemp => $composableBuilder(
    column: $table.currentTemp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get feelsLike => $composableBuilder(
    column: $table.feelsLike,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get uvIndex => $composableBuilder(
    column: $table.uvIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get airQuality => $composableBuilder(
    column: $table.airQuality,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeatherCacheTableOrderingComposer
    extends Composer<_$TotemDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get currentTemp => $composableBuilder(
    column: $table.currentTemp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get feelsLike => $composableBuilder(
    column: $table.feelsLike,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get humidity => $composableBuilder(
    column: $table.humidity,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get windSpeed => $composableBuilder(
    column: $table.windSpeed,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get uvIndex => $composableBuilder(
    column: $table.uvIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get airQuality => $composableBuilder(
    column: $table.airQuality,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get expiresAt => $composableBuilder(
    column: $table.expiresAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeatherCacheTableAnnotationComposer
    extends Composer<_$TotemDatabase, $WeatherCacheTable> {
  $$WeatherCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get currentTemp => $composableBuilder(
    column: $table.currentTemp,
    builder: (column) => column,
  );

  GeneratedColumn<double> get feelsLike =>
      $composableBuilder(column: $table.feelsLike, builder: (column) => column);

  GeneratedColumn<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<int> get humidity =>
      $composableBuilder(column: $table.humidity, builder: (column) => column);

  GeneratedColumn<int> get windSpeed =>
      $composableBuilder(column: $table.windSpeed, builder: (column) => column);

  GeneratedColumn<int> get uvIndex =>
      $composableBuilder(column: $table.uvIndex, builder: (column) => column);

  GeneratedColumn<int> get airQuality => $composableBuilder(
    column: $table.airQuality,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get expiresAt =>
      $composableBuilder(column: $table.expiresAt, builder: (column) => column);
}

class $$WeatherCacheTableTableManager
    extends
        RootTableManager<
          _$TotemDatabase,
          $WeatherCacheTable,
          WeatherCacheData,
          $$WeatherCacheTableFilterComposer,
          $$WeatherCacheTableOrderingComposer,
          $$WeatherCacheTableAnnotationComposer,
          $$WeatherCacheTableCreateCompanionBuilder,
          $$WeatherCacheTableUpdateCompanionBuilder,
          (
            WeatherCacheData,
            BaseReferences<
              _$TotemDatabase,
              $WeatherCacheTable,
              WeatherCacheData
            >,
          ),
          WeatherCacheData,
          PrefetchHooks Function()
        > {
  $$WeatherCacheTableTableManager(_$TotemDatabase db, $WeatherCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> currentTemp = const Value.absent(),
                Value<double> feelsLike = const Value.absent(),
                Value<int> weatherCode = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> humidity = const Value.absent(),
                Value<int?> windSpeed = const Value.absent(),
                Value<int?> uvIndex = const Value.absent(),
                Value<int?> airQuality = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
                Value<DateTime> expiresAt = const Value.absent(),
              }) => WeatherCacheCompanion(
                id: id,
                currentTemp: currentTemp,
                feelsLike: feelsLike,
                weatherCode: weatherCode,
                condition: condition,
                humidity: humidity,
                windSpeed: windSpeed,
                uvIndex: uvIndex,
                airQuality: airQuality,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double currentTemp,
                required double feelsLike,
                required int weatherCode,
                required String condition,
                required int humidity,
                Value<int?> windSpeed = const Value.absent(),
                Value<int?> uvIndex = const Value.absent(),
                Value<int?> airQuality = const Value.absent(),
                required DateTime cachedAt,
                required DateTime expiresAt,
              }) => WeatherCacheCompanion.insert(
                id: id,
                currentTemp: currentTemp,
                feelsLike: feelsLike,
                weatherCode: weatherCode,
                condition: condition,
                humidity: humidity,
                windSpeed: windSpeed,
                uvIndex: uvIndex,
                airQuality: airQuality,
                cachedAt: cachedAt,
                expiresAt: expiresAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeatherCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$TotemDatabase,
      $WeatherCacheTable,
      WeatherCacheData,
      $$WeatherCacheTableFilterComposer,
      $$WeatherCacheTableOrderingComposer,
      $$WeatherCacheTableAnnotationComposer,
      $$WeatherCacheTableCreateCompanionBuilder,
      $$WeatherCacheTableUpdateCompanionBuilder,
      (
        WeatherCacheData,
        BaseReferences<_$TotemDatabase, $WeatherCacheTable, WeatherCacheData>,
      ),
      WeatherCacheData,
      PrefetchHooks Function()
    >;
typedef $$WeatherForecastTableCreateCompanionBuilder =
    WeatherForecastCompanion Function({
      Value<int> id,
      required DateTime forecastTime,
      required double temp,
      required int weatherCode,
      required String condition,
      required int precipitationProb,
      required DateTime cachedAt,
    });
typedef $$WeatherForecastTableUpdateCompanionBuilder =
    WeatherForecastCompanion Function({
      Value<int> id,
      Value<DateTime> forecastTime,
      Value<double> temp,
      Value<int> weatherCode,
      Value<String> condition,
      Value<int> precipitationProb,
      Value<DateTime> cachedAt,
    });

class $$WeatherForecastTableFilterComposer
    extends Composer<_$TotemDatabase, $WeatherForecastTable> {
  $$WeatherForecastTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get forecastTime => $composableBuilder(
    column: $table.forecastTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get temp => $composableBuilder(
    column: $table.temp,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get precipitationProb => $composableBuilder(
    column: $table.precipitationProb,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$WeatherForecastTableOrderingComposer
    extends Composer<_$TotemDatabase, $WeatherForecastTable> {
  $$WeatherForecastTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get forecastTime => $composableBuilder(
    column: $table.forecastTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get temp => $composableBuilder(
    column: $table.temp,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get condition => $composableBuilder(
    column: $table.condition,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get precipitationProb => $composableBuilder(
    column: $table.precipitationProb,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$WeatherForecastTableAnnotationComposer
    extends Composer<_$TotemDatabase, $WeatherForecastTable> {
  $$WeatherForecastTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get forecastTime => $composableBuilder(
    column: $table.forecastTime,
    builder: (column) => column,
  );

  GeneratedColumn<double> get temp =>
      $composableBuilder(column: $table.temp, builder: (column) => column);

  GeneratedColumn<int> get weatherCode => $composableBuilder(
    column: $table.weatherCode,
    builder: (column) => column,
  );

  GeneratedColumn<String> get condition =>
      $composableBuilder(column: $table.condition, builder: (column) => column);

  GeneratedColumn<int> get precipitationProb => $composableBuilder(
    column: $table.precipitationProb,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$WeatherForecastTableTableManager
    extends
        RootTableManager<
          _$TotemDatabase,
          $WeatherForecastTable,
          WeatherForecastData,
          $$WeatherForecastTableFilterComposer,
          $$WeatherForecastTableOrderingComposer,
          $$WeatherForecastTableAnnotationComposer,
          $$WeatherForecastTableCreateCompanionBuilder,
          $$WeatherForecastTableUpdateCompanionBuilder,
          (
            WeatherForecastData,
            BaseReferences<
              _$TotemDatabase,
              $WeatherForecastTable,
              WeatherForecastData
            >,
          ),
          WeatherForecastData,
          PrefetchHooks Function()
        > {
  $$WeatherForecastTableTableManager(
    _$TotemDatabase db,
    $WeatherForecastTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$WeatherForecastTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$WeatherForecastTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$WeatherForecastTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> forecastTime = const Value.absent(),
                Value<double> temp = const Value.absent(),
                Value<int> weatherCode = const Value.absent(),
                Value<String> condition = const Value.absent(),
                Value<int> precipitationProb = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => WeatherForecastCompanion(
                id: id,
                forecastTime: forecastTime,
                temp: temp,
                weatherCode: weatherCode,
                condition: condition,
                precipitationProb: precipitationProb,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required DateTime forecastTime,
                required double temp,
                required int weatherCode,
                required String condition,
                required int precipitationProb,
                required DateTime cachedAt,
              }) => WeatherForecastCompanion.insert(
                id: id,
                forecastTime: forecastTime,
                temp: temp,
                weatherCode: weatherCode,
                condition: condition,
                precipitationProb: precipitationProb,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$WeatherForecastTableProcessedTableManager =
    ProcessedTableManager<
      _$TotemDatabase,
      $WeatherForecastTable,
      WeatherForecastData,
      $$WeatherForecastTableFilterComposer,
      $$WeatherForecastTableOrderingComposer,
      $$WeatherForecastTableAnnotationComposer,
      $$WeatherForecastTableCreateCompanionBuilder,
      $$WeatherForecastTableUpdateCompanionBuilder,
      (
        WeatherForecastData,
        BaseReferences<
          _$TotemDatabase,
          $WeatherForecastTable,
          WeatherForecastData
        >,
      ),
      WeatherForecastData,
      PrefetchHooks Function()
    >;
typedef $$RssFeedItemsTableCreateCompanionBuilder =
    RssFeedItemsCompanion Function({
      Value<int> id,
      required String feedSource,
      required String title,
      required String link,
      Value<String?> summary,
      Value<String?> imageUrl,
      required DateTime publishedAt,
      Value<bool> isRead,
      required DateTime cachedAt,
    });
typedef $$RssFeedItemsTableUpdateCompanionBuilder =
    RssFeedItemsCompanion Function({
      Value<int> id,
      Value<String> feedSource,
      Value<String> title,
      Value<String> link,
      Value<String?> summary,
      Value<String?> imageUrl,
      Value<DateTime> publishedAt,
      Value<bool> isRead,
      Value<DateTime> cachedAt,
    });

class $$RssFeedItemsTableFilterComposer
    extends Composer<_$TotemDatabase, $RssFeedItemsTable> {
  $$RssFeedItemsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get feedSource => $composableBuilder(
    column: $table.feedSource,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RssFeedItemsTableOrderingComposer
    extends Composer<_$TotemDatabase, $RssFeedItemsTable> {
  $$RssFeedItemsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get feedSource => $composableBuilder(
    column: $table.feedSource,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get link => $composableBuilder(
    column: $table.link,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRead => $composableBuilder(
    column: $table.isRead,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get cachedAt => $composableBuilder(
    column: $table.cachedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RssFeedItemsTableAnnotationComposer
    extends Composer<_$TotemDatabase, $RssFeedItemsTable> {
  $$RssFeedItemsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get feedSource => $composableBuilder(
    column: $table.feedSource,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get link =>
      $composableBuilder(column: $table.link, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get publishedAt => $composableBuilder(
    column: $table.publishedAt,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRead =>
      $composableBuilder(column: $table.isRead, builder: (column) => column);

  GeneratedColumn<DateTime> get cachedAt =>
      $composableBuilder(column: $table.cachedAt, builder: (column) => column);
}

class $$RssFeedItemsTableTableManager
    extends
        RootTableManager<
          _$TotemDatabase,
          $RssFeedItemsTable,
          RssFeedItem,
          $$RssFeedItemsTableFilterComposer,
          $$RssFeedItemsTableOrderingComposer,
          $$RssFeedItemsTableAnnotationComposer,
          $$RssFeedItemsTableCreateCompanionBuilder,
          $$RssFeedItemsTableUpdateCompanionBuilder,
          (
            RssFeedItem,
            BaseReferences<_$TotemDatabase, $RssFeedItemsTable, RssFeedItem>,
          ),
          RssFeedItem,
          PrefetchHooks Function()
        > {
  $$RssFeedItemsTableTableManager(_$TotemDatabase db, $RssFeedItemsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RssFeedItemsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RssFeedItemsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RssFeedItemsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> feedSource = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> link = const Value.absent(),
                Value<String?> summary = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                Value<DateTime> publishedAt = const Value.absent(),
                Value<bool> isRead = const Value.absent(),
                Value<DateTime> cachedAt = const Value.absent(),
              }) => RssFeedItemsCompanion(
                id: id,
                feedSource: feedSource,
                title: title,
                link: link,
                summary: summary,
                imageUrl: imageUrl,
                publishedAt: publishedAt,
                isRead: isRead,
                cachedAt: cachedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String feedSource,
                required String title,
                required String link,
                Value<String?> summary = const Value.absent(),
                Value<String?> imageUrl = const Value.absent(),
                required DateTime publishedAt,
                Value<bool> isRead = const Value.absent(),
                required DateTime cachedAt,
              }) => RssFeedItemsCompanion.insert(
                id: id,
                feedSource: feedSource,
                title: title,
                link: link,
                summary: summary,
                imageUrl: imageUrl,
                publishedAt: publishedAt,
                isRead: isRead,
                cachedAt: cachedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RssFeedItemsTableProcessedTableManager =
    ProcessedTableManager<
      _$TotemDatabase,
      $RssFeedItemsTable,
      RssFeedItem,
      $$RssFeedItemsTableFilterComposer,
      $$RssFeedItemsTableOrderingComposer,
      $$RssFeedItemsTableAnnotationComposer,
      $$RssFeedItemsTableCreateCompanionBuilder,
      $$RssFeedItemsTableUpdateCompanionBuilder,
      (
        RssFeedItem,
        BaseReferences<_$TotemDatabase, $RssFeedItemsTable, RssFeedItem>,
      ),
      RssFeedItem,
      PrefetchHooks Function()
    >;
typedef $$CalendarEventsTableCreateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<int> id,
      required String externalId,
      required String title,
      required DateTime startTime,
      required DateTime endTime,
      Value<String?> description,
      Value<String?> location,
      Value<int?> color,
      required String source,
      required DateTime syncedAt,
    });
typedef $$CalendarEventsTableUpdateCompanionBuilder =
    CalendarEventsCompanion Function({
      Value<int> id,
      Value<String> externalId,
      Value<String> title,
      Value<DateTime> startTime,
      Value<DateTime> endTime,
      Value<String?> description,
      Value<String?> location,
      Value<int?> color,
      Value<String> source,
      Value<DateTime> syncedAt,
    });

class $$CalendarEventsTableFilterComposer
    extends Composer<_$TotemDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CalendarEventsTableOrderingComposer
    extends Composer<_$TotemDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get color => $composableBuilder(
    column: $table.color,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get syncedAt => $composableBuilder(
    column: $table.syncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CalendarEventsTableAnnotationComposer
    extends Composer<_$TotemDatabase, $CalendarEventsTable> {
  $$CalendarEventsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<DateTime> get syncedAt =>
      $composableBuilder(column: $table.syncedAt, builder: (column) => column);
}

class $$CalendarEventsTableTableManager
    extends
        RootTableManager<
          _$TotemDatabase,
          $CalendarEventsTable,
          CalendarEvent,
          $$CalendarEventsTableFilterComposer,
          $$CalendarEventsTableOrderingComposer,
          $$CalendarEventsTableAnnotationComposer,
          $$CalendarEventsTableCreateCompanionBuilder,
          $$CalendarEventsTableUpdateCompanionBuilder,
          (
            CalendarEvent,
            BaseReferences<
              _$TotemDatabase,
              $CalendarEventsTable,
              CalendarEvent
            >,
          ),
          CalendarEvent,
          PrefetchHooks Function()
        > {
  $$CalendarEventsTableTableManager(
    _$TotemDatabase db,
    $CalendarEventsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CalendarEventsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CalendarEventsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CalendarEventsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> externalId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<DateTime> startTime = const Value.absent(),
                Value<DateTime> endTime = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int?> color = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<DateTime> syncedAt = const Value.absent(),
              }) => CalendarEventsCompanion(
                id: id,
                externalId: externalId,
                title: title,
                startTime: startTime,
                endTime: endTime,
                description: description,
                location: location,
                color: color,
                source: source,
                syncedAt: syncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String externalId,
                required String title,
                required DateTime startTime,
                required DateTime endTime,
                Value<String?> description = const Value.absent(),
                Value<String?> location = const Value.absent(),
                Value<int?> color = const Value.absent(),
                required String source,
                required DateTime syncedAt,
              }) => CalendarEventsCompanion.insert(
                id: id,
                externalId: externalId,
                title: title,
                startTime: startTime,
                endTime: endTime,
                description: description,
                location: location,
                color: color,
                source: source,
                syncedAt: syncedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CalendarEventsTableProcessedTableManager =
    ProcessedTableManager<
      _$TotemDatabase,
      $CalendarEventsTable,
      CalendarEvent,
      $$CalendarEventsTableFilterComposer,
      $$CalendarEventsTableOrderingComposer,
      $$CalendarEventsTableAnnotationComposer,
      $$CalendarEventsTableCreateCompanionBuilder,
      $$CalendarEventsTableUpdateCompanionBuilder,
      (
        CalendarEvent,
        BaseReferences<_$TotemDatabase, $CalendarEventsTable, CalendarEvent>,
      ),
      CalendarEvent,
      PrefetchHooks Function()
    >;
typedef $$MascotProfileTableCreateCompanionBuilder =
    MascotProfileCompanion Function({
      Value<int> id,
      required String name,
      required DateTime birthDate,
    });
typedef $$MascotProfileTableUpdateCompanionBuilder =
    MascotProfileCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> birthDate,
    });

class $$MascotProfileTableFilterComposer
    extends Composer<_$TotemDatabase, $MascotProfileTable> {
  $$MascotProfileTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$MascotProfileTableOrderingComposer
    extends Composer<_$TotemDatabase, $MascotProfileTable> {
  $$MascotProfileTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get birthDate => $composableBuilder(
    column: $table.birthDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$MascotProfileTableAnnotationComposer
    extends Composer<_$TotemDatabase, $MascotProfileTable> {
  $$MascotProfileTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get birthDate =>
      $composableBuilder(column: $table.birthDate, builder: (column) => column);
}

class $$MascotProfileTableTableManager
    extends
        RootTableManager<
          _$TotemDatabase,
          $MascotProfileTable,
          MascotProfileData,
          $$MascotProfileTableFilterComposer,
          $$MascotProfileTableOrderingComposer,
          $$MascotProfileTableAnnotationComposer,
          $$MascotProfileTableCreateCompanionBuilder,
          $$MascotProfileTableUpdateCompanionBuilder,
          (
            MascotProfileData,
            BaseReferences<
              _$TotemDatabase,
              $MascotProfileTable,
              MascotProfileData
            >,
          ),
          MascotProfileData,
          PrefetchHooks Function()
        > {
  $$MascotProfileTableTableManager(
    _$TotemDatabase db,
    $MascotProfileTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MascotProfileTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MascotProfileTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MascotProfileTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> birthDate = const Value.absent(),
              }) => MascotProfileCompanion(
                id: id,
                name: name,
                birthDate: birthDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime birthDate,
              }) => MascotProfileCompanion.insert(
                id: id,
                name: name,
                birthDate: birthDate,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$MascotProfileTableProcessedTableManager =
    ProcessedTableManager<
      _$TotemDatabase,
      $MascotProfileTable,
      MascotProfileData,
      $$MascotProfileTableFilterComposer,
      $$MascotProfileTableOrderingComposer,
      $$MascotProfileTableAnnotationComposer,
      $$MascotProfileTableCreateCompanionBuilder,
      $$MascotProfileTableUpdateCompanionBuilder,
      (
        MascotProfileData,
        BaseReferences<_$TotemDatabase, $MascotProfileTable, MascotProfileData>,
      ),
      MascotProfileData,
      PrefetchHooks Function()
    >;

class $TotemDatabaseManager {
  final _$TotemDatabase _db;
  $TotemDatabaseManager(this._db);
  $$WeatherCacheTableTableManager get weatherCache =>
      $$WeatherCacheTableTableManager(_db, _db.weatherCache);
  $$WeatherForecastTableTableManager get weatherForecast =>
      $$WeatherForecastTableTableManager(_db, _db.weatherForecast);
  $$RssFeedItemsTableTableManager get rssFeedItems =>
      $$RssFeedItemsTableTableManager(_db, _db.rssFeedItems);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(_db, _db.calendarEvents);
  $$MascotProfileTableTableManager get mascotProfile =>
      $$MascotProfileTableTableManager(_db, _db.mascotProfile);
}

mixin _$WeatherDaoMixin on DatabaseAccessor<TotemDatabase> {
  $WeatherCacheTable get weatherCache => attachedDatabase.weatherCache;
  $WeatherForecastTable get weatherForecast => attachedDatabase.weatherForecast;
  WeatherDaoManager get managers => WeatherDaoManager(this);
}

class WeatherDaoManager {
  final _$WeatherDaoMixin _db;
  WeatherDaoManager(this._db);
  $$WeatherCacheTableTableManager get weatherCache =>
      $$WeatherCacheTableTableManager(_db.attachedDatabase, _db.weatherCache);
  $$WeatherForecastTableTableManager get weatherForecast =>
      $$WeatherForecastTableTableManager(
        _db.attachedDatabase,
        _db.weatherForecast,
      );
}

mixin _$RssDaoMixin on DatabaseAccessor<TotemDatabase> {
  $RssFeedItemsTable get rssFeedItems => attachedDatabase.rssFeedItems;
  RssDaoManager get managers => RssDaoManager(this);
}

class RssDaoManager {
  final _$RssDaoMixin _db;
  RssDaoManager(this._db);
  $$RssFeedItemsTableTableManager get rssFeedItems =>
      $$RssFeedItemsTableTableManager(_db.attachedDatabase, _db.rssFeedItems);
}

mixin _$CalendarDaoMixin on DatabaseAccessor<TotemDatabase> {
  $CalendarEventsTable get calendarEvents => attachedDatabase.calendarEvents;
  CalendarDaoManager get managers => CalendarDaoManager(this);
}

class CalendarDaoManager {
  final _$CalendarDaoMixin _db;
  CalendarDaoManager(this._db);
  $$CalendarEventsTableTableManager get calendarEvents =>
      $$CalendarEventsTableTableManager(
        _db.attachedDatabase,
        _db.calendarEvents,
      );
}

mixin _$MascotDaoMixin on DatabaseAccessor<TotemDatabase> {
  $MascotProfileTable get mascotProfile => attachedDatabase.mascotProfile;
  MascotDaoManager get managers => MascotDaoManager(this);
}

class MascotDaoManager {
  final _$MascotDaoMixin _db;
  MascotDaoManager(this._db);
  $$MascotProfileTableTableManager get mascotProfile =>
      $$MascotProfileTableTableManager(_db.attachedDatabase, _db.mascotProfile);
}
