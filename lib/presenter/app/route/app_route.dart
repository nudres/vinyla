import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:vinyla/domain/domain.dart';
import 'package:vinyla/presenter/app/application.dart';
import 'package:vinyla/presenter/features/features.dart';

class AppRoute {
  static const initial = '/';

  static const authorization = 'authorization';
  static const allVinyl = 'allVinyl';
  static const myLibrary = 'myLibrary';
  static const myProfile = 'myProfile';

  static const _loginPathPart = 'login';
  static const _vinylPathPart = 'vinyl';
  static const _libraryPathPart = 'library';
  static const _profilePathPart = 'profile';

  static List<RouteBase> prepareRoutes(GetIt di) {
    return [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/$_loginPathPart',
      ),
      GoRoute(
        name: authorization,
        path: '/$_loginPathPart',
        builder: (_, __) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(di<LoginCredentialUseCase>()),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: allVinyl,
        path: '/$_vinylPathPart',
        pageBuilder: (_, GoRouterState state) => FadeTransitionPage(
          key: state.pageKey,
          child: HomeScreen(
            selectedTab: HomeTab.vinyls,
            child: Container(
              color: Colors.red,
            ),
          ),
        ),
      ),
      GoRoute(
        name: myLibrary,
        path: '/$_libraryPathPart',
        pageBuilder: (_, GoRouterState state) => FadeTransitionPage(
          key: state.pageKey,
          child: HomeScreen(
            selectedTab: HomeTab.library,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
      GoRoute(
        name: myProfile,
        path: '/$_profilePathPart',
        pageBuilder: (_, GoRouterState state) => FadeTransitionPage(
          key: state.pageKey,
          child: HomeScreen(
            selectedTab: HomeTab.profile,
            child: Container(
              color: Colors.yellow,
            ),
          ),
        ),
      ),
    ];
  }
}
