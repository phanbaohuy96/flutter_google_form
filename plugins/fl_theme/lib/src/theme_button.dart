import 'package:flutter/material.dart';

import 'extension.dart';

class ThemeButton {
  ThemeButton._();

  static Widget primary({
    Key? key,
    required String title,
    void Function()? onPressed,
    bool enable = true,
    Widget? prefixIcon,
    Size minimumSize = const Size(88, 48),
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    EdgeInsetsGeometry? padding,
  }) =>
      ElevatedButton(
        key: key,
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          minimumSize: minimumSize,
          padding: padding,
        ),
        child: prefixIcon != null
            ? Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [prefixIcon, Container(child: Text(title))],
              )
            : Text(
                title,
                textAlign: TextAlign.center,
              ),
      );

  static Widget secondary({
    Key? key,
    String title = '',
    void Function()? onPressed,
    bool enable = true,
    Widget? prefixIcon,
    Size minimumSize = const Size(88, 48),
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    EdgeInsetsGeometry? padding,
  }) =>
      outline(
        key: key,
        title: title,
        onPressed: onPressed,
        enable: enable,
        prefixIcon: prefixIcon,
        minimumSize: minimumSize,
        mainAxisAlignment: mainAxisAlignment,
        padding: padding,
      );

  static Widget outline({
    Key? key,
    required String title,
    void Function()? onPressed,
    bool enable = true,
    Widget? prefixIcon,
    Size minimumSize = const Size(88, 48),
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
    EdgeInsetsGeometry? padding,
    Color? color,
  }) =>
      OutlinedButton(
        key: key,
        onPressed: enable ? onPressed : null,
        style: ButtonStyle(
          minimumSize: WidgetStateProperty.resolveWith<Size>(
            (_) => minimumSize,
          ),
          padding: padding == null
              ? null
              : WidgetStateProperty.resolveWith<EdgeInsetsGeometry>(
                  (_) => padding,
                ),
          foregroundColor: color == null
              ? null
              : WidgetStateProperty.resolveWith<Color?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return null;
                    }
                    return color;
                  },
                ),
          side: color == null
              ? null
              : WidgetStateProperty.resolveWith<BorderSide?>(
                  (Set<WidgetState> states) {
                    if (states.contains(WidgetState.disabled)) {
                      return null;
                    }
                    return BorderSide(
                      color: color,
                      width: 1,
                    );
                  },
                ),
        ),
        child: prefixIcon != null
            ? Row(
                mainAxisAlignment: mainAxisAlignment,
                children: [prefixIcon, Text(title)],
              )
            : Text(
                title,
                textAlign: TextAlign.center,
              ),
      );

  static Widget text({
    Key? key,
    required String title,
    void Function()? onPressed,
    Size minimumSize = const Size(88, 48),
    bool enable = true,
    EdgeInsetsGeometry? padding,
  }) =>
      TextButton(
        style: TextButton.styleFrom(
          minimumSize: minimumSize,
          padding: padding,
        ),
        key: key,
        onPressed: enable ? onPressed : null,
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      );

  static Widget custom({
    Key? key,
    required BuildContext context,
    required String title,
    void Function()? onPressed,
    EdgeInsetsGeometry? padding,
    Size minimumSize = const Size(88, 48),
    bool enable = true,
    Color? bgBtnColor,
    BorderRadiusGeometry? borderRadius,
    Widget? prefixIcon,
    Widget? surfixIcon,
  }) =>
      ElevatedButton(
        key: key,
        onPressed: enable ? onPressed : null,
        style: ElevatedButton.styleFrom(
          minimumSize: minimumSize,
          padding: padding,
          backgroundColor: bgBtnColor,
          textStyle: context.textTheme.buttonText,
          shape: borderRadius != null
              ? RoundedRectangleBorder(
                  borderRadius: borderRadius,
                )
              : null,
        ),
        child: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  children: [
                    if (prefixIcon != null)
                      WidgetSpan(
                        child: prefixIcon,
                        alignment: PlaceholderAlignment.middle,
                      ),
                    TextSpan(
                      text: title,
                    ),
                  ],
                  style: context.textTheme.buttonText,
                ),
                textAlign:
                    surfixIcon != null ? TextAlign.start : TextAlign.center,
              ),
            ),
            surfixIcon ?? const SizedBox(),
          ],
        ),
      );
}
