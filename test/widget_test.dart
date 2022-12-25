import 'package:flutter_test/flutter_test.dart';

import 'package:vinyla/config/config.dart';

import 'package:vinyla/presenter/app/application.dart';

void main() {
  testWidgets('App', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final diContainer = await configureDependencies();

    await tester.pumpWidget(App(
      di: diContainer,
    ));
  });
}
