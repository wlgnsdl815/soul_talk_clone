import 'dart:math';

import 'package:flutter/material.dart';

class FlyLight extends StatefulWidget {
  final Widget child;

  const FlyLight({
    super.key,
    required this.child,
  });

  @override
  State<FlyLight> createState() => _FlyLightState();
}

class _FlyLightState extends State<FlyLight>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final List<Firefly> _fireflies = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();

    for (int i = 0; i < 30; i++) {
      _fireflies.add(Firefly());
    }
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
        for (var firefly in _fireflies) {
          firefly.updatePosition();
        }
        return CustomPaint(
          painter: BackgroundPainter(_fireflies),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SafeArea(child: widget.child),
          ),
        );
      },
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final List<Firefly> fireflies;

  BackgroundPainter(this.fireflies);

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTWH(0.0, 0.0, size.width, size.height);
    Gradient gradient = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Color(0xFF00152F),
        Color(0xFF00152F),
        Color.fromARGB(255, 0, 59, 135),
      ],
    );
    final Paint paint = Paint()..shader = gradient.createShader(rect);
    canvas.drawRect(rect, paint);

    for (var firefly in fireflies) {
      final fireflyPaint = Paint()..color = firefly.color;
      canvas.drawCircle(Offset(firefly.x * size.width, firefly.y * size.height),
          firefly.size, fireflyPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Firefly {
  double x;
  double y;
  double dx;
  double dy;
  double size;
  Color color;
  final random = Random();

  Firefly()
      : x = Random().nextDouble(),
        y = Random().nextDouble(),
        dx = (Random().nextDouble() * 0.002 - 0.001),
        dy = (Random().nextDouble() * 0.002 - 0.001),
        size = (Random().nextDouble() * 2 + 1),
        color = getRandomColor();

  static Color getRandomColor() {
    final colors = [
      Colors.yellow.withOpacity(0.8),
      Colors.yellow.withOpacity(0.6),
      Colors.yellow.withOpacity(0.4),
      Colors.grey.withOpacity(0.4),
    ];
    return colors[Random().nextInt(colors.length)];
  }

  void updatePosition() {
    x += dx;
    y += dy;

    if (x < 0 || x > 1) dx = -dx;
    if (y < 0 || y > 1) dy = -dy;
  }
}
