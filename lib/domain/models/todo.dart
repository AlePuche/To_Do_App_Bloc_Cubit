/*
Objeto To do, sus propiedades y método de palanca on & off
*/

class Todo {
  final int id;
  final String text;
  final bool isCompleted;

  Todo({
    required this.id,
    required this.text,
    this.isCompleted = false, //initially, todos are not completed
  });

  Todo toggleCompletion() {
    return Todo(
        id: id,
        text: text,
        isCompleted:!isCompleted,
    ); //toggle the completion status
  }
}
