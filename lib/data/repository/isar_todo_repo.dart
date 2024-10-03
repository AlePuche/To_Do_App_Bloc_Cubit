/*
DATABASE REPO

All about implementation in the isar database (storing, retrieving, updating,
and deleting information)

*/

import 'package:isar/isar.dart';
import 'package:to_do_bloc_cubit/data/models/isar_todo.dart';
import 'package:to_do_bloc_cubit/domain/models/todo.dart';
import 'package:to_do_bloc_cubit/domain/repository/todo_repo.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    //fetch from db
    final todos = await db.todoIsars.where().findAll();
    //return as a list of todos and give to domain layer
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  @override
  Future<void> addTodo(Todo newTodo) async {
    // convert to do into isar
    final todoIsar = TodoIsar.fromDomain(newTodo);
    //so that we can store it in the db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> updateTodo(Todo todo) {
    // convert to do into isar
    final todoIsar = TodoIsar.fromDomain(todo);
    //so that we can store it in the db
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  @override
  Future<void> deleteTodo(Todo todo) async {
    await db.writeTxn(() => db.todoIsars.delete(todo.id));
  }
}