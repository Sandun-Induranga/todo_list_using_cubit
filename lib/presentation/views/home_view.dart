import 'package:flutter/material.dart';

import '../widgets/add_todo_section.dart';
import '../widgets/todo_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {

    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AddTodoSection(),
            SizedBox(height: 16),
            TodoList(),
          ],
        ),
      ),
    );
  }
}
