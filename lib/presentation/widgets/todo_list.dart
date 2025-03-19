import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/cubit/todo_cubit.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return const Center(
              child: Text('No tasks added yet!'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.todos.length,
            itemBuilder: (context, index) {
              final todo = state.todos[index];
              return ListTile(
                leading: Checkbox(
                  value: todo.isCompleted,
                  onChanged: (value) =>
                      context.read<TodoCubit>().toggleTodo(todo.id),
                ),
                title: Text(
                  todo.title,
                  style: TextStyle(
                    decoration: todo.isCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () =>
                      context.read<TodoCubit>().deleteTodo(todo.id),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
