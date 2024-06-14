import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:teaching_app/utils/contants.dart';

import '../app_theme.dart';
import '../utils/contants.dart';


class FilledArrowIcon extends StatelessWidget {
  final int direction;
  const FilledArrowIcon({super.key,required this.direction});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: direction == Direction.up || direction == Direction.down ? const Size(18, 10):const Size(10, 18),
      painter: NextIconPainter(ThemeColor.darkBlue4392, direction: direction),
    );
  }
}



class NextIconPainter extends CustomPainter {
  final Color color;
  final int direction;

  NextIconPainter(this.color, {this.direction = Direction.right});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = color;

    Path path = Path();
    switch (direction) {
      case Direction.up:
        path
          ..moveTo(size.width / 2, 0) // starting point
          ..lineTo(0, size.height) // bottom left corner
          ..lineTo(size.width, size.height) // bottom right corner
          ..close(); // close path
        break;
      case Direction.down:
        path
          ..moveTo(0, 0) // starting point
          ..lineTo(size.width, 0) // top right corner
          ..lineTo(size.width / 2, size.height) // bottom center
          ..close(); // close path
        break;
      case Direction.right:
        path
          ..moveTo(size.width, size.height / 2) // starting point
          ..lineTo(0, 0) // top left corner
          ..lineTo(0, size.height) // bottom left corner
          ..close(); // close path
        break;
      case Direction.left:
      default:
        path
          ..moveTo(0, size.height / 2) // starting point
          ..lineTo(size.width, 0) // top right corner
          ..lineTo(size.width, size.height) // bottom right corner
          ..close(); // close path
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

