import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@InjectableInit()
Future<GetIt> configureDependencies({String environment = Environment.dev}) async {
  final di = GetIt.asNewInstance();
  $initGetIt(di, environment: environment);
  return di;
}

@module
abstract class RegisterModule {}
