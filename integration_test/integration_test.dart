import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:fluttertodostate/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets("App does not show any task", (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();
  });
}
