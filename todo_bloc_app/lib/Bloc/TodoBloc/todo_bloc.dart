import 'package:bloc/bloc.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_event.dart';
import 'package:todo_bloc_app/Bloc/TodoBloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents,TodoStates>{

  TodoBloc():super(TodoStates()){

  }

  void _addTaskEvent(AddTaskEvent event, Emitter<TodoStates> emit){
  }
}