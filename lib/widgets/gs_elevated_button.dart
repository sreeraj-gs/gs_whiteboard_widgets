import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart'; // For responsive sizing if needed

class GsElevatedButton extends StatelessWidget {
  const GsElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.textStyle,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final double? width;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final double? elevation;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: backgroundColor ?? Color(0xFF0060FF),
      foregroundColor: foregroundColor ?? Colors.white,
      padding: padding,
      elevation: elevation,
      textStyle:
          textStyle ??
          Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.white),
      shape:
          borderRadius != null
              ? RoundedRectangleBorder(borderRadius: borderRadius!)
              : RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

      fixedSize:
          (width != null && height != null)
              ? Size(width!, height!)
              : Size(double.maxFinite, 40),
      minimumSize:
          (width != null && height == null)
              ? Size(width!, 0)
              : (height != null && width == null)
              ? Size(0, height!)
              : null,
    );

    return ElevatedButton(style: style, onPressed: onPressed, child: child);
  }
}
