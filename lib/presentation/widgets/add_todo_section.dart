import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/todo_cubit.dart';

class AddTodoSection extends StatelessWidget {
  const AddTodoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: 'Enter a task',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            final title = controller.text;
            if (title.isNotEmpty) {
              context.read<TodoCubit>().addTodo(title);
              controller.clear();
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please enter a task'),
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
