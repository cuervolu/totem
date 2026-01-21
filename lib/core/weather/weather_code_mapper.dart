class WeatherCodeMapper {
  static String getCondition(int wmoCode) {
    return switch (wmoCode) {
      0 => 'Despejado',
      1 || 2 => 'Parcialmente nublado',
      3 => 'Nublado',
      45 || 48 => 'Niebla',
      51 || 53 || 55 => 'Llovizna',
      61 || 63 || 65 => 'Lluvia',
      66 || 67 => 'Lluvia helada',
      71 || 73 || 75 => 'Nieve',
      77 => 'Granizo',
      80 || 81 || 82 => 'Chubascos',
      85 || 86 => 'Nevadas',
      95 => 'Tormenta',
      96 || 99 => 'Tormenta con granizo',
      _ => 'Desconocido',
    };
  }
}
