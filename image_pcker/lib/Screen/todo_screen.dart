import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_bloc.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_event.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_state.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos Bloc'),
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<TodoBloc, TodoState>(builder: (context, state) {
          if (state.todoList.isEmpty) {
            return const Center(
              child: Text(
                "No Todo's Found",
                style: TextStyle(color: Colors.blueGrey),
              ),
            );
          }
          if (state.todoList.isNotEmpty) {
            return ListView.builder(
                itemCount:state.todoList.length,
                itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  state.todoList[index],
                  style: const TextStyle(color: Colors.blueGrey),
                ),
                trailing: IconButton(
                  onPressed: () {
                    context.read<TodoBloc>().add(DeleteTodo(task: state.todoList[index]));
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.blueGrey,
                  ),
                ),
              );
            });
          } else {
            return const SizedBox(
              height: 20,
            );
          }
        }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey,
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(AddTodoTask(task: 'Task $i'));
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
