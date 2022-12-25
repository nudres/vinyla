import 'package:flutter/material.dart';
import 'package:vinyla/config/l10n/l10n.dart';

extension BuildContextAlertDialog on BuildContext {
  void showFailureAlertDialog(
    String title,
    String description,
  ) {
    showDialog<void>(
      context: this,
      builder: (BuildContext context) {
        final textTheme = Theme.of(context).textTheme;
        final colorScheme = Theme.of(context).colorScheme;
        return AlertDialog(
          title: Text(
            title,
            style: textTheme.titleLarge?.copyWith(color: colorScheme.primary),
          ),
          content: Text(
            description,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.secondary),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(l10n.common_ok),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
