import 'package:flutter/material.dart';
import 'package:vinyla/config/l10n/l10n.dart';
import 'package:vinyla/domain/domain.dart';

extension ExceptionRecourceMatch on BuildContext {
  String getMessage(BaseExceptionType? type, String? message) {
    switch (type) {
      case BaseExceptionType.authTimeoutConnection:
        return message ?? l10n.auth_failure_timeout_connection;
      case BaseExceptionType.authPhoneUnknownException:
        return message ?? l10n.auth_failure_phone_unknown;
      case BaseExceptionType.authParcelableFirebaseException:
        return message ?? l10n.auth_failure_phone_unknown;
      default:
        return l10n.common_unknown_exception;
    }
  }
}
