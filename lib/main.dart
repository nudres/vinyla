import 'package:get_it/get_it.dart';

import 'package:vinyla/config/bootstrap.dart';
import 'package:vinyla/presenter/app/application.dart';

void main() {
  bootstrap((GetIt diContainer) async {
    return App(
      di: diContainer,
    );
  });
}
