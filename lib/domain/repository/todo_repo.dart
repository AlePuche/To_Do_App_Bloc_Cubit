/*
  Lo que la app hace
 */

import '../models/todo.dart';

abstract class TodoRepo{
  //get list of todos
  Future<List<Todo>> getTodos();
  //add a new to do
  Future<void> addTodo(Todo newTodo);
  //update a to do
  Future<void> updateTodo(Todo todo);
  //delete a to do
  Future<void> deleteTodo(Todo todo);

}