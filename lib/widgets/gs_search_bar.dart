import 'package:flutter/material.dart';
import 'package:gs_whiteboard_widgets/utils/sizer.dart';

class GsSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final TextEditingController? controller;
  final double? width;
  final double? height;
  final EdgeInsetsGeometry contentPadding;
  final Color backgroundColor;
  final double borderRadius;
  final IconData searchIcon;
  final Color? searchIconColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;

  const GsSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.controller,
    this.width,
    this.height = 45,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16.0,
      vertical: 11.0,
    ),
    this.backgroundColor = const Color(0xFFF2F2F2),
    this.borderRadius = 10.0,
    this.searchIcon = Icons.search,
    this.searchIconColor,
    this.hintStyle,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Color effectiveIconColor = searchIconColor ?? Color(0xFF8B8A8D);
    final TextStyle effectiveHintStyle =
        hintStyle ?? TextStyle(color: Colors.grey[600], fontSize: 14.0);
    final TextStyle effectiveTextStyle =
        textStyle ??
        TextStyle(color: theme.textTheme.bodyLarge?.color, fontSize: 14.0);

    return Container(
      width: width ?? 20.w,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        textAlignVertical: TextAlignVertical.center,
        style: effectiveTextStyle,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: effectiveHintStyle,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding: contentPadding,
          suffixIcon: Icon(searchIcon, color: effectiveIconColor),
          isDense: true,
        ),
      ),
    );
  }
}
