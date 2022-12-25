import 'package:flutter/material.dart';

import 'package:vinyla/config/config.dart';
import 'package:vinyla/config/l10n/l10n.dart';

class LoginScreenPhone extends StatelessWidget {
  const LoginScreenPhone({
    Key? key,
    required this.onLogin,
    required this.onSwitchLoginType,
    required this.phoneController,
  }) : super(key: key);

  final Function() onLogin;
  final Function() onSwitchLoginType;

  final TextEditingController phoneController;

  @override
  Widget build(BuildContext context) {
    late final ThemeData theme = Theme.of(context);

    return SafeArea(
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
                style: theme.textTheme.headlineLarge!.copyWith(color: theme.colorScheme.background),
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
                          style: theme.textTheme.headlineSmall!.copyWith(color: theme.colorScheme.secondary),
                        ),
                        const SizedBox(
                          height: 48,
                        ),
                        Column(
                          children: [
                            TextFormField(
                                keyboardType: TextInputType.phone,
                                controller: phoneController,
                                style: theme.textTheme.bodySmall,
                                decoration: InputDecoration(
                                  hintText: context.l10n.auth_hint_phone,
                                  hintStyle: theme.textTheme.bodySmall,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              indent: 24,
                              endIndent: 24,
                            )),
                            ElevatedButton(
                              style: Theme.of(context).extension<ElevatedButtonStyles>()!.primary,
                              onPressed: () => onLogin(),
                              child: Text(
                                context.l10n.auth_sign_in,
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                indent: 24,
                                endIndent: 24,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: onSwitchLoginType,
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 24),
                            child: Text(
                              context.l10n.auth_login_by_credential,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.secondary,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
