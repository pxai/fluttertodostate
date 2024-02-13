import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodostate/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodostate/provider/todolist_provider.dart';
import 'package:fluttertodostate/models/todo.dart';

main() {
  testWidgets("App does not show any task", (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: MyApp()));

    Finder defaultText = find.byElementType(ListView);

    expect(defaultText, findsNothing);
  });

  testWidgets("App shows a task from provider", (WidgetTester tester) async {
    TodoListNotifier todoListNotifier = TodoListNotifier(
      <Todo>[Todo(todoId: UniqueKey(), content: "Task 1", completed: false)],
    );
    await tester.pumpWidget(ProviderScope(overrides: [
      todoListProvider.overrideWith((ref) => todoListNotifier),
    ], child: MyApp()));

    Finder defaultText = find.text("Task 1");

    expect(defaultText, findsOneWidget);
  });
}
