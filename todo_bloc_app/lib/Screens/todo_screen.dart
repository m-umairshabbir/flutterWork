import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_bloc.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_event.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_state.dart';

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
        title: const Text('Bloc Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        child: IconButton(onPressed: () {
          context.read<TodoBloc>().add(AddTaskEvent());
        }, icon: const Icon(Icons.add)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: BlocBuilder<TodoBloc,TodoStates>(builder: (context,state){
          if(state.todoList.isEmpty){
            return const Center(child: Text("No Todo's Found"),);
          }
          else if(state.todoList.isNotEmpty)
          {
            return ListView.builder(
                itemCount: state.todoList.length,
                itemBuilder: (context,index){
              return ListTile(
                title: Text('task :$index'),
                trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.delete)),
              );
            });
          }
          else
          {
            return const SizedBox(height: 20,);
          }
        }
        ),

        ),

    );
  }
}
