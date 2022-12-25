import 'base_type_exception.dart';

class BaseException implements Exception {
  BaseException({
    this.type,
    this.message,
  });

  final BaseExceptionType? type;
  final String? message;

  String get getMessage => message ?? toString();
}
