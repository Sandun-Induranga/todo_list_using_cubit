import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list_cubit/presentation/views/home_view.dart';

import 'cubit/todo_cubit.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'Todo List',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeView(),
      ),
    );
  }
}

