import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:vinyla/config/config.dart';
import 'package:vinyla/presenter/app/application.dart';

class App extends StatefulWidget {
  const App({
    Key? key,
    required this.di,
  }) : super(key: key);

  final GetIt di;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppCubit>.value(
          value: AppCubit(),
        ),
      ],
      child: Builder(
        builder: (context) => BlocBuilder<AppCubit, AppState>(
          buildWhen: (previous, current) => previous.themeSettings != current.themeSettings,
          builder: (context, state) {
            return AppThemeProvider(
              settings: state.themeSettings,
              lightDynamic: null,
              darkDynamic: null,
              child: BlocBuilder<AppCubit, AppState>(
                buildWhen: (previous, current) =>
                    previous.effectiveLocale != current.effectiveLocale ||
                    previous.effectiveThemeMode != current.effectiveThemeMode,
                builder: (context, state) {
                  final themeProvider = AppThemeProvider.of(context);
                  return MaterialApp.router(
                    locale: state.effectiveLocale,
                    localizationsDelegates: AppLocalizations.localizationsDelegates,
                    supportedLocales: AppLocalizations.supportedLocales,
                    themeMode: state.effectiveThemeMode,
                    theme: themeProvider.light(),
                    darkTheme: themeProvider.dark(),
                    routerConfig: GoRouter(
                      routes: AppRoute.prepareRoutes(widget.di),
                      initialLocation: AppRoute.initial,
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
