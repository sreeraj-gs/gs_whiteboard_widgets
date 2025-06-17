import 'package:flutter/material.dart';

Future<T?> showStyledAdaptiveDialog<T>({
  required BuildContext context,
  required Widget child,
  EdgeInsets? insetPadding,
  bool barrierDismissible = true,
}) {
  const double buttonSize = 26.0;

  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        insetPadding: insetPadding ?? EdgeInsets.zero,
        child: Stack(
          clipBehavior: Clip.none,
          fit: StackFit.passthrough,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: buttonSize / 2,
                right: buttonSize / 2,
              ),
              child: child,
            ),
            Positioned(
              right: 0,
              top: 0,
              child: InkWell(
                borderRadius: BorderRadius.circular(buttonSize / 2),
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: buttonSize,
                  height: buttonSize,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE6E6E7),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4.0,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.close_rounded,
                    color: Color(0xFF757575),
                    size: 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
