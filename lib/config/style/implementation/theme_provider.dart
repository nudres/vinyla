import 'package:flutter/material.dart';

// ignore: depend_on_referenced_packages
import 'package:material_color_utilities/material_color_utilities.dart';
import 'package:google_fonts/google_fonts.dart';

import '../style.dart';

class AppThemeProvider extends InheritedWidget {
  const AppThemeProvider({
    super.key,
    required this.settings,
    required this.lightDynamic,
    required this.darkDynamic,
    required super.child,
  }) : super();

  final ThemeSettings settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  Color custom(CustomColor custom) {
    if (custom.blend) {
      return blend(custom.color);
    } else {
      return custom.color;
    }
  }

  Color blend(Color targetColor) {
    return Color(Blend.harmonize(targetColor.value, settings.seedColor.value));
  }

  Color source(Color? target) {
    Color source = settings.seedColor;
    if (target != null) {
      source = blend(target);
    }
    return source;
  }

  ColorScheme colors(Brightness brightness, Color? targetColor) {
    final dynamicPrimary = brightness == Brightness.light ? lightDynamic?.primary : darkDynamic?.primary;
    final colorSchemeOverride =
        brightness == Brightness.light ? settings.lightColorSchemeOverride : settings.darkColorSchemeOverride;
    return ColorScheme.fromSeed(
      seedColor: dynamicPrimary ?? source(targetColor),
      brightness: brightness,
      primary: colorSchemeOverride?.primary,
      onPrimary: colorSchemeOverride?.onPrimary,
      primaryContainer: colorSchemeOverride?.primaryContainer,
      onPrimaryContainer: colorSchemeOverride?.onPrimaryContainer,
      secondary: colorSchemeOverride?.secondary,
      onSecondary: colorSchemeOverride?.onSecondary,
      secondaryContainer: colorSchemeOverride?.secondaryContainer,
      onSecondaryContainer: colorSchemeOverride?.onSecondaryContainer,
      tertiary: colorSchemeOverride?.tertiary,
      onTertiary: colorSchemeOverride?.onTertiary,
      tertiaryContainer: colorSchemeOverride?.tertiaryContainer,
      onTertiaryContainer: colorSchemeOverride?.onTertiaryContainer,
      error: colorSchemeOverride?.error,
      onError: colorSchemeOverride?.onError,
      errorContainer: colorSchemeOverride?.errorContainer,
      onErrorContainer: colorSchemeOverride?.onErrorContainer,
      outline: colorSchemeOverride?.outline,
      background: colorSchemeOverride?.background,
      onBackground: colorSchemeOverride?.onBackground,
      surface: colorSchemeOverride?.surface,
      onSurface: colorSchemeOverride?.onSurface,
      surfaceVariant: colorSchemeOverride?.surfaceVariant,
      onSurfaceVariant: colorSchemeOverride?.onSurfaceVariant,
      inverseSurface: colorSchemeOverride?.inverseSurface,
      onInverseSurface: colorSchemeOverride?.onInverseSurface,
      inversePrimary: colorSchemeOverride?.inversePrimary,
      shadow: colorSchemeOverride?.shadow,
      surfaceTint: colorSchemeOverride?.surfaceTint,
    );
  }

  ShapeBorder get shapeMedium => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      );

  ElevatedButtonStyles elevatedButtonStyles(ColorScheme colors) {
    return ElevatedButtonStyles(
      primary: ElevatedButton.styleFrom(
        foregroundColor: colors.onPrimary,
        backgroundColor: colors.primary,
        disabledForegroundColor: colors.onPrimaryContainer.withOpacity(0.38),
        disabledBackgroundColor: colors.onPrimaryContainer.withOpacity(0.12),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      neutral: ElevatedButton.styleFrom(
        foregroundColor: colors.onBackground,
        backgroundColor: colors.surface,
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      primaryOnDark: ElevatedButton.styleFrom(
        foregroundColor: colors.onPrimary,
        backgroundColor: colors.primary,
        disabledForegroundColor: colors.onPrimary.withOpacity(0.5),
        disabledBackgroundColor: colors.primary.withOpacity(0.5),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
      neutralOnDark: ElevatedButton.styleFrom(
        foregroundColor: colors.background,
        backgroundColor: colors.outline,
        disabledForegroundColor: colors.onBackground.withOpacity(0.5),
        disabledBackgroundColor: colors.background.withOpacity(0.5),
      ).copyWith(elevation: ButtonStyleButton.allOrNull(0.0)),
    );
  }

  OutlinedButtonStyles outlinedButtonStyles(ColorScheme colors) {
    return OutlinedButtonStyles(
      neutral: OutlinedButton.styleFrom(
        foregroundColor: colors.onBackground,
        side: BorderSide(
          color: colors.onBackground.withOpacity(0.2),
        ),
      ),
    );
  }

  TextButtonStyles textButtonStyles(ColorScheme colors) {
    return TextButtonStyles(
      neutral: TextButton.styleFrom(
        foregroundColor: colors.secondary,
      ),
      dangerous: TextButton.styleFrom(
        foregroundColor: colors.error,
      ),
      callStart: TextButton.styleFrom(
        foregroundColor: colors.onTertiary,
        backgroundColor: colors.tertiary,
        disabledForegroundColor: colors.onTertiary.withOpacity(0.38),
      ),
      callHangup: TextButton.styleFrom(
        foregroundColor: colors.onError,
        backgroundColor: colors.error,
        disabledForegroundColor: colors.onError.withOpacity(0.38),
      ),
      callAction: TextButton.styleFrom(
        foregroundColor: colors.surface,
        backgroundColor: colors.surface.withOpacity(0.3),
      ),
      callActiveAction: TextButton.styleFrom(
        foregroundColor: colors.onSurface,
        backgroundColor: colors.surface,
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme(ColorScheme colors) {
    return InputDecorationTheme(
      filled: true,
      fillColor: Colors.blueGrey[50],
      labelStyle: const TextStyle(fontSize: 12),
      contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 8),
      errorStyle: const TextStyle(height: 0.5),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.onBackground.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: colors.onBackground.withOpacity(0.1), width: 1),
        borderRadius: BorderRadius.circular(8),
      ),
      border: MaterialStateOutlineInputBorder.resolveWith(
        (states) {
          final Color borderColor;
          final bool isError = states.contains(MaterialState.error);
          if (states.contains(MaterialState.disabled)) {
            borderColor = isError ? colors.error.withOpacity(0.25) : colors.onBackground.withOpacity(0.1);
          } else if (states.contains(MaterialState.focused)) {
            borderColor = isError ? colors.error : colors.primary;
          } else {
            borderColor = isError ? colors.error.withOpacity(0.5) : colors.onBackground.withOpacity(0.1);
          }
          return OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1),
            borderRadius: BorderRadius.circular(8),
          );
        },
      ),
    );
  }

  AppBarTheme appBarTheme(ColorScheme colors) {
    return const AppBarTheme(
      scrolledUnderElevation: 0,
      centerTitle: true,
    );
  }

  PopupMenuThemeData popupMenuTheme(ColorScheme colors) {
    return const PopupMenuThemeData();
  }

  BottomNavigationBarThemeData bottomNavigationBarTheme(ColorScheme colors) {
    return BottomNavigationBarThemeData(
      backgroundColor: colors.surface,
    );
  }

  ElevatedButtonThemeData elevatedButtonTheme(ColorScheme colors) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    );
  }

  OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colors) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    );
  }

  TextButtonThemeData textButtonTheme(ColorScheme colors) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: const StadiumBorder(),
      ),
    );
  }

  ListTileThemeData listTileTheme(ColorScheme colors) {
    return ListTileThemeData(
      iconColor: colors.secondary,
    );
  }

  SnackBarThemeData snackBarTheme(ColorScheme colors) {
    return SnackBarThemeData(
      actionTextColor: colors.surface,
    );
  }

  ThemeData? light([Color? targetColor]) {
    final colorScheme = colors(Brightness.light, targetColor);
    return ThemeData.from(
      colorScheme: colorScheme,
      textTheme: GoogleFonts.montserratTextTheme(),
      useMaterial3: true,
    ).copyWith(
        inputDecorationTheme: inputDecorationTheme(colorScheme),
        extensions: [
          elevatedButtonStyles(colorScheme),
          outlinedButtonStyles(colorScheme),
          textButtonStyles(colorScheme),
        ],
        primaryColorLight: colorScheme.secondaryContainer,
        primaryColorDark: colorScheme.onSecondaryContainer,
        dividerColor: colorScheme.outline,
        unselectedWidgetColor: colorScheme.onSurface,
        indicatorColor: colorScheme.primary,
        appBarTheme: appBarTheme(colorScheme),
        bottomNavigationBarTheme: bottomNavigationBarTheme(colorScheme),
        elevatedButtonTheme: elevatedButtonTheme(colorScheme),
        outlinedButtonTheme: outlinedButtonTheme(colorScheme),
        textButtonTheme: textButtonTheme(colorScheme),
        listTileTheme: listTileTheme(colorScheme),
        snackBarTheme: snackBarTheme(colorScheme),
        popupMenuTheme: popupMenuTheme(colorScheme));
  }

  ThemeData? dark([Color? targetColor]) {
    // ignore: unused_local_variable
    final colorScheme = colors(Brightness.dark, targetColor);
    // TODO: Not implemented yet
    return null;
  }

  static AppThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppThemeProvider>()!;
  }

  @override
  bool updateShouldNotify(covariant AppThemeProvider oldWidget) {
    return oldWidget.settings != settings;
  }
}
