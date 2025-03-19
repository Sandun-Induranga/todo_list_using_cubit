import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/cubit/todo_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    final TextEditingController _controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    final title = _controller.text;
                    if (title.isNotEmpty) {
                      context.read<TodoCubit>().addTodo(title);
                      _controller.clear();
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please enter a task'),
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  if(state.todos.isEmpty){
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
                          onChanged: (value) => context.read<TodoCubit>().toggleTodo(todo.id),
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
                          onPressed: () {
                            // Delete task
                          },
                        ),
                      );
                    },
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
