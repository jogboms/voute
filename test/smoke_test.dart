// This is a basic Flutter widget test.
// To perform an interaction with a widget in your test, use the WidgetTester utility that Flutter
// provides. For example, you can send tap and scroll gestures. You can also use WidgetTester to
// find child widgets in the widget tree, read text, and verify that the values of widget properties
// are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:voute/environments/environment.dart';
import 'package:voute/widgets/app.dart';
import 'package:voute/widgets/bootstrap.dart';

void main() {
  testWidgets('Smoke test', (WidgetTester tester) async {
    final BootstrapModel bs = await bootstrap(Env.MOCK, true);

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      App(bootstrap: bs),
    );

    expect(find.byType(App), findsOneWidget);
  });
}
