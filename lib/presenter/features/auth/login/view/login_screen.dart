import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:vinyla/config/config.dart';
import 'package:vinyla/config/l10n/l10n.dart';

import 'package:vinyla/domain/domain.dart';

import 'package:vinyla/presenter/app/route/app_route.dart';
import 'package:vinyla/presenter/common/common.dart';

import '../bloc/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  late final LoginCubit _bloc = BlocProvider.of(context);
  late final ThemeData _theme = Theme.of(context);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is SuccessLogin) _navigateToHome();
          if (state is FailureTypeLogin) _showFailureResourceDialog(state.type);
          if (state is FailureMessageLogin) _showFailureDialog(state.message);
        },
        builder: (context, state) => SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: BoxDecoration(
                    color: _theme.colorScheme.surface,
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(16),
                      bottomRight: Radius.circular(16),
                    )),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Text(
                          context.l10n.app_name,
                          style: _theme.textTheme.headlineLarge!.copyWith(color: _theme.colorScheme.background),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Card(
                          elevation: 8,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.height * 0.4,
                            height: MediaQuery.of(context).size.height * 0.6,
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    context.l10n.auth_authorization,
                                    style:
                                        _theme.textTheme.headlineSmall!.copyWith(color: _theme.colorScheme.secondary),
                                  ),
                                  const SizedBox(
                                    height: 48,
                                  ),
                                  Column(
                                    children: [
                                      TextFormField(
                                          keyboardType: TextInputType.emailAddress,
                                          controller: _emailController,
                                          style: _theme.textTheme.bodySmall,
                                          decoration: InputDecoration(
                                            hintText: context.l10n.auth_hint_email,
                                            hintStyle: _theme.textTheme.bodySmall,
                                          )),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      TextFormField(
                                        keyboardType: TextInputType.emailAddress,
                                        controller: _passwordController,
                                        style: _theme.textTheme.bodySmall,
                                        decoration: InputDecoration(
                                          hintText: context.l10n.auth_hint_password,
                                          hintStyle: _theme.textTheme.bodySmall,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 24,
                                  ),
                                  ElevatedButton(
                                    style: Theme.of(context).extension<ElevatedButtonStyles>()!.primary,
                                    onPressed: () => _pressLogin(),
                                    child: Text(
                                      context.l10n.auth_sign_in,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _pressLogin() {
    _bloc.loginByCredential(_emailController.text, _passwordController.text);
  }

  void _showFailureResourceDialog(BaseExceptionType type) {
    final title = context.l10n.common_exception_title;
    final message = context.getMessage(type);
    context.showFailureAlertDialog(title, message);
  }

  void _showFailureDialog(String message) {
    final title = context.l10n.common_exception_title;
    context.showFailureAlertDialog(title, message);
  }

  void _navigateToHome() {
    context.pushNamed(AppRoute.allVinyl);
  }
}
