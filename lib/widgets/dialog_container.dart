import 'package:flutter/material.dart';

class DialogContainer extends StatelessWidget {
  final double? width;
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const DialogContainer({
    super.key,
    this.width,
    required this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding ?? EdgeInsets.symmetric(vertical: 22, horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFD4D4D4), width: 0.25),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 6.7,
            spreadRadius: 1,
            color: Colors.black.withValues(alpha: 0.1),
          ),

          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.08),
          ),
        ],
      ),
      child: AnimatedSize(duration: Duration(milliseconds: 300), child: child),
    );
  }
}
