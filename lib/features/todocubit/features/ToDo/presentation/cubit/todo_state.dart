part of 'todo_cubit.dart';

abstract class TodoState {
  final List<ToDo> todos;

  const TodoState(this.todos);

  @override
  List<Object> get props => [todos];
}

class TodoInitial extends TodoState {
  // Initialize with an empty list
  const TodoInitial() : super(const []);
}

class ToDoUpdate extends TodoState {
  final List<ToDo> todoList;
  const ToDoUpdate(this.todoList) : super(todoList);
}
