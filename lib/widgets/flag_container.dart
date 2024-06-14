import 'package:flutter/material.dart';
import 'package:teaching_app/app_theme.dart';
import 'package:teaching_app/widgets/text_view.dart';

class FlagContainer extends StatelessWidget {
  final Widget child;
  final String flagTitle;
  final Color flagTitleColor;
  final Color? bgColor;
  final double? height;
  const FlagContainer({
    this.height,
    required this.child,
    required this.flagTitle,
    required this.flagTitleColor,
    this.bgColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
      Container(
      height: height, // adjust height as needed
      decoration: BoxDecoration(
        color: bgColor ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
        child: child,
      ),
        Positioned(
          top: 0,
          left: 20,
          child: ContinueWatchingTag(title: flagTitle,flagTitleColor: flagTitleColor,),
        ),

      ],
    );
  }
}


class ContinueWatchingTag extends StatelessWidget {
  final String title;
  final Color flagTitleColor;

  const ContinueWatchingTag({super.key,required this.title,required this.flagTitleColor});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(left: 25, top: 7.5,bottom: 5,right: 50),
        decoration: ShapeDecoration(
          color: flagTitleColor,
          shape: _CustomShapeBorder(),
        ),
        child: TextView(title,textColor: Colors.white,fontsize: 14,)

    );
  }
}

class _CustomShapeBorder extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions => EdgeInsets.zero;

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.left, rect.top) // Top-left corner
      ..lineTo(rect.right, rect.top) // Top-right corner
      ..lineTo(rect.right - rect.width * 0.1, rect.bottom) // Bottom-right corner
      ..lineTo(rect.left + rect.width * 0.1, rect.bottom) // Bottom-left corner
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}