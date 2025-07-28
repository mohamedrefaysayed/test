import 'package:bloc/bloc.dart';
import 'package:my_first_app/features/todocubit/features/ToDo/data/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  // Start with TodoInitial (which contains an empty list)
  TodoCubit() : super(TodoInitial());

  void addToDo(String task, Priority priority) {
    List<ToDo> newstate = List.from(state.todos);
    newstate.add(ToDo(text: task, priority: priority));
    emit(ToDoUpdate(newstate));
  }

  void removeToDo(int index) {
    List<ToDo> newstate = List.from(state.todos);
    newstate.removeAt(index);
    emit(ToDoUpdate(newstate));
  }

  void editToDo(String text, Priority priority, int index) {
    List<ToDo> newstate = List.from(state.todos);
    newstate.removeAt(index);
    newstate.insert(index, ToDo(text: text, priority: priority));
    emit(ToDoUpdate(newstate));
  }
}
