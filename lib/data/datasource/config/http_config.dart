import 'package:injectable/injectable.dart';

@singleton
class HttpConfig {
  final Duration requestTimeout = const Duration(seconds: 30);
}
