import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertodostate/provider/todolist_provider.dart';
import 'package:fluttertodostate/models/todo.dart';

void main() {
  late ProviderContainer container;
  late TodoListNotifier todoListNotifier;
  setUp(() {
    container = ProviderContainer();
    todoListNotifier = container.read(todoListProvider.notifier);
  });

  // tearDown();

  test('initial state is empty array', () {
    expect(todoListNotifier.debugState.length, 0);
    expect(todoListNotifier.debugState, []);
  });

  test('changes length after adding element', () {
    expect(todoListNotifier.debugState.length, 0);
    expect(todoListNotifier.debugState, []);

    container.read(todoListProvider.notifier).add('New Task');

    expect(todoListNotifier.debugState.length, 1);
    expect(todoListNotifier.debugState[0].content, 'New Task');
  });

  test('completes task', () {
    container.read(todoListProvider.notifier).add('New Task');

    expect(todoListNotifier.debugState.length, 1);
    expect(todoListNotifier.debugState[0].completed, false);

    container
        .read(todoListProvider.notifier)
        .completeTodo(todoListNotifier.debugState[0]);

    expect(todoListNotifier.debugState[0].completed, true);
  });

  test('remove todo', () {
    container.read(todoListProvider.notifier).add('New Task');

    expect(todoListNotifier.debugState.length, 1);

    container
        .read(todoListProvider.notifier)
        .remove(todoListNotifier.debugState[0].todoId);

    expect(todoListNotifier.debugState.length, 0);
  });
}
