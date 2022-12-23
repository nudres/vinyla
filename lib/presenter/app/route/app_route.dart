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

  static List<RouteBase> prepareRoutes(GetIt di) {
    return [
      GoRoute(
        path: '/',
        redirect: (_, __) => '/$_loginPathPart',
      ),
      GoRoute(
        name: _loginPathPart,
        path: '/$_loginPathPart',
        builder: (context, state) => BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(di<LoginCredentialUseCase>()),
          child: const LoginScreen(),
        ),
      ),
    ];
  }
}
