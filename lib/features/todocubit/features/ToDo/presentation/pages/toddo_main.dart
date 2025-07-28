import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_first_app/features/todocubit/features/ToDo/data/models/todo_model.dart';
import 'package:my_first_app/features/todocubit/features/ToDo/presentation/cubit/todo_cubit.dart';

class ToDoMain extends StatelessWidget {
  const ToDoMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state.todos.isEmpty) {
            return Center(child: Text("No ToDos Yet !"));
          }
          return ListView.builder(
            itemCount: state.todos.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: state.todos[index].priority == Priority.high
                      ? Colors.red
                      : state.todos[index].priority == Priority.medium
                      ? Colors.orange
                      : Colors.green,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 10)],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(state.todos[index].text),
                    IconButton(
                      onPressed: () {
                        context.read<TodoCubit>().removeToDo(index);
                      },
                      icon: Icon(Icons.delete, color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<TodoCubit>().addToDo("Test", Priority.medium);
        },
      ),
    );
  }
}
