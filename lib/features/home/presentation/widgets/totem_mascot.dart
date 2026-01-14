import 'package:flutter/material.dart';

class TotemMascot extends StatefulWidget {
  const TotemMascot({super.key});

  @override
  State<TotemMascot> createState() => _TotemMascotState();
}

class _TotemMascotState extends State<TotemMascot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..repeat(reverse: true);

    _pulseAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bodyColor = theme.colorScheme.primary;
    final detailColor = theme.colorScheme.onSurface;

    return AnimatedBuilder(
      animation: _pulseAnimation,
      builder: (context, child) {
        return CustomPaint(
          size: const Size(128, 128),
          painter: _TotemMascotPainter(
            bodyColor: bodyColor,
            detailColor: detailColor,
            pulseScale: _pulseAnimation.value,
          ),
        );
      },
    );
  }
}

class _TotemMascotPainter extends CustomPainter {
  final Color bodyColor;
  final Color detailColor;
  final double pulseScale;

  _TotemMascotPainter({
    required this.bodyColor,
    required this.detailColor,
    required this.pulseScale,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) * pulseScale;

    // Pulse outer circle
    canvas.drawCircle(
      center,
      radius * 1.1,
      Paint()
        ..color = bodyColor.withValues(alpha: 0.2)
        ..style = PaintingStyle.fill,
    );

    // Body
    canvas.drawCircle(
      center,
      radius,
      Paint()
        ..color = bodyColor
        ..style = PaintingStyle.fill,
    );

    // Eyes
    final eyeY = center.dy - radius * 0.2;
    final eyeRadius = radius * 0.1;

    canvas.drawCircle(
      Offset(center.dx - radius * 0.25, eyeY),
      eyeRadius,
      Paint()..color = detailColor,
    );

    canvas.drawCircle(
      Offset(center.dx + radius * 0.25, eyeY),
      eyeRadius,
      Paint()..color = detailColor,
    );

    // Mouth (smile)
    final mouthPath = Path();
    final startX = center.dx - radius * 0.25;
    final endX = center.dx + radius * 0.25;
    final mouthY = center.dy + radius * 0.15;
    final controlY = mouthY + radius * 0.15;

    mouthPath.moveTo(startX, mouthY);
    mouthPath.quadraticBezierTo(center.dx, controlY, endX, mouthY);

    canvas.drawPath(
      mouthPath,
      Paint()
        ..color = detailColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3,
    );
  }

  @override
  bool shouldRepaint(_TotemMascotPainter oldDelegate) {
    return oldDelegate.pulseScale != pulseScale;
  }
}
