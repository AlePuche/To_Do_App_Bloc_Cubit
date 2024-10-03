import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_bloc_cubit/domain/repository/todo_repo.dart';
import 'package:to_do_bloc_cubit/presentation/todo_cubit.dart';
import 'package:to_do_bloc_cubit/presentation/todo_view.dart';

class TodoPage extends StatelessWidget {
  final TodoRepo todoRepo;

  const TodoPage({super.key, required this.todoRepo});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => TodoCubit(todoRepo),
      child: const TodoView(),
    );
  }
}

