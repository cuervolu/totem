import 'dart:math';
import 'package:flutter/material.dart';
import 'package:totem/core/weather/weather_theme_helper.dart';

class WeatherParticles extends StatefulWidget {
  final WeatherParticleType type;

  const WeatherParticles({super.key, required this.type});

  @override
  State<WeatherParticles> createState() => _WeatherParticlesState();
}

class _WeatherParticlesState extends State<WeatherParticles>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _random = Random();
  late List<_Particle> _particles;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    _particles = List.generate(
      widget.type == WeatherParticleType.thunder ? 8 : 20,
      (i) => _Particle(
        x: _random.nextDouble(),
        y: _random.nextDouble(),
        speed: _random.nextDouble() * 0.5 + 0.5,
        size: widget.type == WeatherParticleType.snow
            ? _random.nextDouble() * 3 + 2
            : _random.nextDouble() * 2 + 1,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: _ParticlePainter(
            particles: _particles,
            progress: _controller.value,
            type: widget.type,
          ),
          child: Container(),
        );
      },
    );
  }
}

class _Particle {
  final double x;
  final double y;
  final double speed;
  final double size;

  _Particle({
    required this.x,
    required this.y,
    required this.speed,
    required this.size,
  });
}

class _ParticlePainter extends CustomPainter {
  final List<_Particle> particles;
  final double progress;
  final WeatherParticleType type;

  _ParticlePainter({
    required this.particles,
    required this.progress,
    required this.type,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.6)
      ..strokeWidth = 1.5
      ..strokeCap = StrokeCap.round;

    for (final particle in particles) {
      final x = particle.x * size.width;
      final y = ((particle.y + progress * particle.speed) % 1.0) * size.height;

      if (type == WeatherParticleType.snow) {
        canvas.drawCircle(
          Offset(x, y),
          particle.size,
          paint..style = PaintingStyle.fill,
        );
      } else if (type == WeatherParticleType.rain) {
        canvas.drawLine(
          Offset(x, y),
          Offset(x, y + particle.size * 8),
          paint..style = PaintingStyle.stroke,
        );
      } else if (type == WeatherParticleType.thunder) {
        if (progress > 0.9 && particle.x > 0.4 && particle.x < 0.6) {
          final lightningPaint = Paint()
            ..color = Colors.yellow.withValues(alpha: 0.8)
            ..strokeWidth = 2
            ..style = PaintingStyle.stroke;

          final path = Path()
            ..moveTo(x, 0)
            ..lineTo(x + 10, size.height * 0.3)
            ..lineTo(x - 5, size.height * 0.3)
            ..lineTo(x + 5, size.height * 0.6);

          canvas.drawPath(path, lightningPaint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant _ParticlePainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
