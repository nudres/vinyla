import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:vinyla/config/l10n/l10n.dart';

import 'package:vinyla/domain/domain.dart';

import 'package:vinyla/presenter/app/route/app_route.dart';
import 'package:vinyla/presenter/common/common.dart';

import '../bloc/login_cubit.dart';
import '../widgets/login_screen_credential.dart';
import '../widgets/login_screen_phone.dart';
import '../widgets/login_screen_phone_verify.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginCubit _bloc = BlocProvider.of(context);
  late final ThemeData _theme = Theme.of(context);

  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<LoginCubit, LoginState>(
        listener: (BuildContext context, LoginState state) {
          if (state is AuthorizedState) _navigateToHome();
          if (state is FailureMessageLogin) _showFailureDialog(state.type, state.message);
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

              // TODO: Nested navigator, will be better
              state.authType == AuthType.credential
                  ? LoginScreenCredential(
                      emailController: _emailController,
                      passwordController: _passwordController,
                      onLogin: _onLoginByCredential,
                      onSwitchLoginType: _switchLoginAsPhone)
                  : state.phoneStep == PhoneStep.phone
                      ? LoginScreenPhone(
                          onLogin: _onLoginByPhone,
                          phoneController: _phoneController,
                          onSwitchLoginType: _switchLoginAsCredential)
                      : LoginScreenPhoneVerify(
                          onLogin: _onVerifyPhone,
                          onCancel: _onCancelPhone,
                          phoneController: _phoneController,
                          codeController: _codeController,
                        ),
            ],
          ),
        ),
      ),
    );
  }

  void _switchLoginAsPhone() async {
    _bloc.switchLoginAsPhone();
  }

  void _switchLoginAsCredential() async {
    _bloc.switchLoginAsCredential();
  }

  void _onLoginByPhone() {
    _bloc.loginByPhone(_phoneController.text);
  }

  void _onLoginByCredential() {
    _bloc.tryLoginByCredential(_emailController.text, _passwordController.text);
  }

  void _onCancelPhone() {
    _bloc.skipPhoneNumberState();
  }

  void _onVerifyPhone() {
    _bloc.tryVerifyPhone(_codeController.text);
  }

  void _showFailureDialog(BaseExceptionType? type, String? message) {
    final title = context.l10n.common_exception_title;
    final description = context.getMessage(type, message);
    context.showFailureAlertDialog(title, description);
  }

  void _navigateToHome() {
    context.pushNamed(AppRoute.allVinyl);
  }
}
