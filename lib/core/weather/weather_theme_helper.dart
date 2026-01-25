import 'package:flutter/material.dart';

class WeatherThemeHelper {
  static Gradient getGradient(int weatherCode) {
    return switch (weatherCode) {
      // Despejado
      0 => const LinearGradient(
        colors: [Color(0xFFFFA726), Color(0xFFFF7043)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      1 || 2 => const LinearGradient(
        colors: [Color(0xFF64B5F6), Color(0xFF42A5F5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      3 => const LinearGradient(
        colors: [Color(0xFF78909C), Color(0xFF607D8B)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      45 || 48 => const LinearGradient(
        colors: [Color(0xFFB0BEC5), Color(0xFF90A4AE)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      >= 51 && <= 55 => const LinearGradient(
        colors: [Color(0xFF546E7A), Color(0xFF455A64)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      >= 61 && <= 67 || >= 80 && <= 82 => const LinearGradient(
        colors: [Color(0xFF37474F), Color(0xFF263238)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      >= 71 && <= 77 || >= 85 && <= 86 => const LinearGradient(
        colors: [Color(0xFF81D4FA), Color(0xFF4FC3F7)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      >= 95 => const LinearGradient(
        colors: [Color(0xFF5E35B1), Color(0xFF512DA8)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),

      // Default (fallback)
      _ => const LinearGradient(
        colors: [Color(0xFF794F82), Color(0xFF6A4373)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    };
  }

  static bool shouldShowParticles(int weatherCode) {
    return switch (weatherCode) {
      >= 51 && <= 67 => true,
      >= 71 && <= 77 => true,
      >= 80 && <= 82 => true,
      >= 85 && <= 86 => true,
      >= 95 => true,
      _ => false,
    };
  }

  static WeatherParticleType getParticleType(int weatherCode) {
    return switch (weatherCode) {
      >= 71 && <= 77 || >= 85 && <= 86 => WeatherParticleType.snow,
      >= 95 => WeatherParticleType.thunder,
      _ => WeatherParticleType.rain,
    };
  }
}

enum WeatherParticleType { rain, snow, thunder }
