import 'package:flutter/material.dart';

import 'app_text_theme.dart';
import 'screen_theme.dart';
import 'theme_color.dart';

class AppTheme {
  final String name;
  final ThemeData theme;

  const AppTheme({
    required this.name,
    required this.theme,
  });

  factory AppTheme.factory({
    required ScreenTheme screenTheme,
    required ThemeColor themeColor,
    bool useMaterial3 = true,
    String? fontFamily,
    AppTextTheme? appTextTheme,
  }) {
    final _appTextTheme = appTextTheme ?? AppTextTheme.create(themeColor);
    final brightness = themeColor.brightness;
    return AppTheme(
      name: brightness.name,
      theme: ThemeData(
        brightness: brightness,
        fontFamily: fontFamily,
        textTheme: _appTextTheme,
        useMaterial3: useMaterial3,
        primaryColor: themeColor.themePrimary,
        primaryColorLight: themeColor.themePrimaryLight,
        primaryColorDark: themeColor.themePrimaryDark,
        cardColor: themeColor.cardBackground,
        scaffoldBackgroundColor: themeColor.scaffoldBackgroundColor,
        unselectedWidgetColor: themeColor.disableColor,
        splashColor: themeColor.splashColor,
        shadowColor: themeColor.shadowColor,
        indicatorColor: themeColor.selected,
        inputDecorationTheme: _inputDecorationTheme(themeColor),
        disabledColor: themeColor.disableColor,
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: themeColor.primary,
          selectionColor: themeColor.primary,
          selectionHandleColor: themeColor.primary,
        ),
        buttonTheme: const ButtonThemeData(
          height: 38,
        ),
        textButtonTheme: _textButtonThemeData(
          textTheme: _appTextTheme,
          themeColor: themeColor,
        ),
        elevatedButtonTheme: _elevatedButtonThemeData(
          textTheme: _appTextTheme,
          themeColor: themeColor,
        ),
        outlinedButtonTheme: _outlinedButtonThemeData(
          textTheme: _appTextTheme,
          themeColor: themeColor,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: themeColor.primary,
          foregroundColor: themeColor.appbarForegroundColor,
          centerTitle: true,
        ),
        tabBarTheme: _tabBarTheme(
          textTheme: _appTextTheme,
          themeColor: themeColor,
        ),
        dividerColor: themeColor.dividerColor,
        dividerTheme: DividerThemeData(
          color: themeColor.dividerColor,
          thickness: 1,
          space: 1,
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: themeColor.primary,
          secondary: themeColor.secondary,
          surface: Colors.white,
          brightness: brightness,
        ),
        platform: TargetPlatform.iOS,
        extensions: [
          screenTheme,
          ThemeColorExtension(colors: themeColor),
          AppTextThemeExtension(textTheme: _appTextTheme),
        ],
      ),
    );
  }

  static TextButtonThemeData _textButtonThemeData({
    required AppTextTheme textTheme,
    required ThemeColor themeColor,
  }) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        textStyle: textTheme.buttonText,
        minimumSize: const Size(88, 48),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: EdgeInsets.zero,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ).copyWith(
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return themeColor.textButtonDisableColor;
            }
            return themeColor.schemeAction;
          },
        ),
      ),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonThemeData({
    required ThemeColor themeColor,
    required AppTextTheme textTheme,
  }) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        disabledForegroundColor: themeColor.disableColor,
        textStyle: textTheme.buttonText,
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        elevation: 0,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).copyWith(
        foregroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return themeColor.elevatedBtnForegroundDisableColor;
            }
            return themeColor.elevatedBtnForegroundColor;
          },
        ),
        backgroundColor: WidgetStateProperty.resolveWith<Color?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return themeColor.elevatedBtnBackgroundDisableColor;
            }
            return themeColor.elevatedBtnBackgroundColor;
          },
        ),
      ),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonThemeData({
    required ThemeColor themeColor,
    required AppTextTheme textTheme,
  }) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(88, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        textStyle: textTheme.buttonText,
        shadowColor: themeColor.splashColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ).copyWith(
        foregroundColor: WidgetStateProperty.resolveWith<Color>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return themeColor.outlineButtonDisableColor;
            }
            return themeColor.outlineButtonColor;
          },
        ),
        side: WidgetStateProperty.resolveWith<BorderSide>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.disabled)) {
              return BorderSide(
                color: themeColor.outlineButtonDisableColor,
                width: 1,
              );
            }
            return BorderSide(
              color: themeColor.outlineButtonColor,
              width: 1,
            );
          },
        ),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(
    ThemeColor themeColor,
  ) {
    final border = UnderlineInputBorder(
      borderSide: BorderSide(color: Colors.grey[300]!, width: 1),
      // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
    final focusedBorder = UnderlineInputBorder(
      borderSide: BorderSide(color: themeColor.primary, width: 1),
      // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
    return InputDecorationTheme(
      border: border,
      enabledBorder: border,
      focusedBorder: focusedBorder,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
    );
  }

  static TabBarTheme _tabBarTheme({
    required AppTextTheme textTheme,
    required ThemeColor themeColor,
  }) {
    return TabBarTheme(
      labelStyle: textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      ),
      unselectedLabelStyle: textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.normal,
      ),
      unselectedLabelColor: themeColor.unselectedLabelColor,
      labelColor: themeColor.selectedLabelColor,
      indicatorColor: themeColor.selected,
    );
  }

  AppTheme copyWith({
    String? name,
    ThemeData? theme,
  }) {
    return AppTheme(
      name: name ?? this.name,
      theme: theme ?? this.theme,
    );
  }
}
