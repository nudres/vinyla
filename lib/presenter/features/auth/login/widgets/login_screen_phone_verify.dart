import 'package:flutter/material.dart';

import 'package:vinyla/config/config.dart';
import 'package:vinyla/config/l10n/l10n.dart';

class LoginScreenPhoneVerify extends StatelessWidget {
  const LoginScreenPhoneVerify({
    Key? key,
    required this.onLogin,
    required this.phoneController,
    required this.codeController,
    required this.onCancel,
  }) : super(key: key);

  final Function() onLogin;
  final Function() onCancel;

  final TextEditingController phoneController;
  final TextEditingController codeController;

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
                                enabled: false,
                                style: theme.textTheme.bodySmall,
                                decoration: InputDecoration(
                                  hintText: context.l10n.auth_hint_phone,
                                  hintStyle: theme.textTheme.bodySmall,
                                )),
                            const SizedBox(
                              height: 8,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: codeController,
                              style: theme.textTheme.bodySmall,
                              maxLength: 6,
                              decoration: InputDecoration(
                                hintText: context.l10n.auth_hint_code,
                                hintStyle: theme.textTheme.bodySmall,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const Spacer(),
                        Row(
                          children: [
                            const Expanded(
                                child: Divider(
                              indent: 24,
                              endIndent: 24,
                            )),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                ElevatedButton(
                                  style: Theme.of(context).extension<ElevatedButtonStyles>()!.primaryOnDark,
                                  onPressed: () => onLogin(),
                                  child: Text(context.l10n.auth_title_verify),
                                ),
                                ElevatedButton(
                                  style: Theme.of(context).extension<ElevatedButtonStyles>()!.neutral,
                                  onPressed: () => onCancel(),
                                  child: Text(context.l10n.auth_title_verify_cancel),
                                ),
                              ],
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
