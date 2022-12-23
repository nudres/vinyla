part of 'app_cubit.dart';

class AppState extends Equatable {
  final ThemeSettings themeSettings;
  final ThemeMode themeMode;
  final Locale locale;

  const AppState({required this.themeSettings, required this.themeMode, required this.locale});

  @override
  List<Object?> get props => [themeSettings, themeMode, locale];

  AppState copyWith({
    ThemeSettings? themeSettings,
    ThemeMode? themeMode,
    Locale? locale,
  }) {
    return AppState(
      themeSettings: themeSettings ?? this.themeSettings,
      themeMode: themeMode ?? this.themeMode,
      locale: locale ?? this.locale,
    );
  }

  bool get isThemeModeSupported => themeSettings.darkColorSchemeOverride != null;

  ThemeMode get effectiveThemeMode => isThemeModeSupported ? themeMode : ThemeMode.light;

  Locale? get effectiveLocale => locale;
}
