/*

CUBIT is a simple state management system
Each cubit is a list of todos.

 */

import 'package:flutter_bloc/flutter_bloc.dart';

import '../domain/models/todo.dart';
import '../domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>>{
  // reference to do repository
  final TodoRepo todoRepo;

  // Constructor initializes the cubit with an empty list of todos
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }
  //LOAD
  Future<void> loadTodos() async {
    // fetch list of todos from repository
    final todoList = await todoRepo.getTodos();

    // emit the fetched list to the new state
    emit(todoList);
  }

  //ADD
  Future<void> addTodo(String text) async {
    // create a new to do with unique Id
    final newTodo = Todo(
        id: DateTime.now().millisecondsSinceEpoch,
        text: text,
        isCompleted: false
    );

    // save the new to do to repository
    await todoRepo.addTodo(newTodo);

    //re-load
    loadTodos();
  }

  //DELETE
  Future<void> deleteTodo(Todo todo) async {
    // delete the to do from repository
    await todoRepo.deleteTodo(todo);
    // re-load
    loadTodos();
  }

  //TOGGLE o UPDATE
  Future<void> toggleCompletion(Todo todo) async {
    // toggle the completion status of provided to do
    final updatedTodo = todo.toggleCompletion();

    // update the to do in repository with new completion status
    await todoRepo.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}