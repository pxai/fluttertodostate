import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fluttertodostate/add.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodostate/provider/todolist_provider.dart';
import 'package:fluttertodostate/models/todo.dart';

main() {
  testWidgets("Adds a new task", (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: AddTodo()));

    Finder addTodoTextfield = find.text('Add Todo');
    final textFieldFinder = find.byType(TextField);
    expect(textFieldFinder, findsOneWidget);

    // Finder addTodoButton = find.byKey(ValueKey('add_todo_button'));
    // expect(addTodoButton, findsOneWidget);

    // await tester.tap(addTodoButton);
    // await tester.pump();
  });
}
