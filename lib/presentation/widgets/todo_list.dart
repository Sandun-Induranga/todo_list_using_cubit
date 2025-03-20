import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/cubit/todo_cubit.dart';
import 'package:todo_list_cubit/presentation/widgets/todo_item.dart';

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
              TodoItem(todo: state.todos[index]);
            },
          );
        },
      ),
    );
  }
}
