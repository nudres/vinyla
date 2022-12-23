import 'package:flutter/material.dart';

import '../style.dart';

const _colorPlatePrimary = Color(0xFFF54D3D);
const _colorPlateSecondary = Color(0xFFB97D60);
const _colorPlateAdditional1 = Color(0xFFB49384);
const _colorPlateAdditional2 = Color(0xFFF0A160);
const _colorPlateAdditional3 = Color(0xFFF0CCB0);
const _colorPlateAdditional4 = Color(0xFFFFFFFF);
const _colorPlateAdditional5 = Color(0xFF000000);
const _colorPlateAdditional6 = Color(0xFFE74C3C);

const _gradientTop = CustomColor(
  color: _colorPlateAdditional1,
  blend: false,
);

const _gradientBottom = CustomColor(
  color: _colorPlateSecondary,
  blend: false,
);

class CustomColor {
  const CustomColor({
    required this.color,
    this.blend = true,
  });

  final Color color;
  final bool blend;

  Color value(AppThemeProvider provider) {
    return provider.custom(this);
  }
}

const themeSettings = ThemeSettings(
  seedColor: _colorPlatePrimary,
  lightColorSchemeOverride: ColorSchemeOverride(
    primary: _colorPlatePrimary,
    secondary: _colorPlateSecondary,
    secondaryContainer: _colorPlateAdditional1,
    onSecondaryContainer: _colorPlateAdditional5,
    tertiary: _colorPlateAdditional2,
    error: _colorPlateAdditional6,
    outline: _colorPlateAdditional3,
    background: _colorPlateAdditional5,
    surface: _colorPlateAdditional4,
    onSurface: _colorPlateSecondary,
  ),
  primaryGradientColors: [_gradientTop, _gradientBottom],
);
