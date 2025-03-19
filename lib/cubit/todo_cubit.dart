import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/todo.dart';

class TodoState {
  final List<Todo> todos;

  TodoState(this.todos);
}

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState([]));

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().toString(),
      title: title,
    );
    emit(
      TodoState(
        [...state.todos, newTodo],
      ),
    );
  }

  void toggleTodo(String id) {
    final updatedTodos = state.todos.map((todo) {
      if (todo.id == id) {
        return Todo(
          id: todo.id,
          title: todo.title,
          isCompleted: !todo.isCompleted,
        );
      }
      return todo;
    }).toList();
    emit(
      TodoState(updatedTodos),
    );
  }
}
