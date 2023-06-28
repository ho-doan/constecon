import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../app.dart';
import '../../../generator/colors.gen.dart';

class LoadingDialog {
  LoadingDialog._();
  static LoadingDialog instance = LoadingDialog._();
  OverlayEntry? _overlay;

  void show() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (_overlay == null) {
        _overlay = OverlayEntry(
          builder: (context) => ColoredBox(
            color: Colors.black.withOpacity(.3),
            child: const Center(
              child: LoadingAnimated(),
            ),
          ),
        );
        Overlay.of(navigatorKey.currentState!.context).insert(_overlay!);
      }
    });
  }

  void hide() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _overlay?.remove();
      _overlay = null;
    });
  }
}

class GradientCircularProgressIndicator extends StatelessWidget {
  const GradientCircularProgressIndicator({
    super.key,
    required this.radius,
    required this.gradientColorsStart,
    required this.gradientColorsEnd,
    this.strokeWidth = 10.0,
    this.endPoint,
  });
  final double radius;
  final Color gradientColorsStart;
  final Color gradientColorsEnd;
  final double strokeWidth;
  final double? endPoint;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.fromRadius(radius),
      painter: GradientCircularProgressPainter(
        gradientColors: [
          gradientColorsEnd,
          gradientColorsStart,
        ],
        strokeWidth: strokeWidth,
        endPoint: endPoint,
      ),
    );
  }
}

class LoadingAnimated extends StatefulWidget {
  const LoadingAnimated({
    super.key,
    this.strokeWidth,
    this.radius,
    this.begin,
    this.end,
    this.gradientColorsStart,
    this.gradientColorsEnd,
    this.endPoint,
    this.size,
  });
  final Size? size;
  final double? strokeWidth;
  final double? radius;
  final double? begin;
  final double? end;
  final Color? gradientColorsStart;
  final Color? gradientColorsEnd;
  final double? endPoint;

  @override
  State<LoadingAnimated> createState() => _LoadingAnimatedState();
}

class _LoadingAnimatedState extends State<LoadingAnimated>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween(
        begin: widget.begin ?? 0.0,
        end: widget.end ?? 1.0,
      ).animate(_controller),
      child: SizedBox(
        width: widget.size?.width,
        height: widget.size?.height,
        child: GradientCircularProgressIndicator(
          radius: widget.radius ?? 20,
          strokeWidth: widget.strokeWidth ?? 5,
          gradientColorsEnd:
              widget.gradientColorsEnd ?? AppColors.primary300.withOpacity(0),
          gradientColorsStart:
              widget.gradientColorsStart ?? AppColors.primary300,
          endPoint: widget.endPoint,
        ),
      ),
    );
  }
}

class GradientCircularProgressPainter extends CustomPainter {
  GradientCircularProgressPainter({
    required this.gradientColors,
    required this.strokeWidth,
    this.endPoint,
  });
  final List<Color> gradientColors;
  final double strokeWidth;
  final double? endPoint;

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.height / 2;
    size = Size.fromRadius(radius);
    final offset = strokeWidth / 2;
    final scapToDegree = offset / radius;
    final startAngle = _degreeToRad(270) + scapToDegree;
    final sweepAngle = _degreeToRad(endPoint ?? 360) - (2 * scapToDegree);
    final rect =
        Rect.fromCircle(center: Offset(radius, radius), radius: radius);
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = strokeWidth;
    paint.shader = SweepGradient(
            colors: gradientColors,
            tileMode: TileMode.repeated,
            startAngle: _degreeToRad(270),
            endAngle: _degreeToRad(270 + 360.0))
        .createShader(
            Rect.fromCircle(center: Offset(radius, radius), radius: 0));

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  double _degreeToRad(double degree) => degree * pi / 180;

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
