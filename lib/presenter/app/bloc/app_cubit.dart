import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:vinyla/config/config.dart';

import '../../../config/style/implementation/vinyla_style.dart';
import '../../../config/style/implementation/theme_settings.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit()
      : super(const AppState(
          themeSettings: themeSettings,
          themeMode: ThemeMode.light,
          locale: Locale.fromSubtags(languageCode: "en"),
        ));
}
