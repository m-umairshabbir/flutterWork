import 'package:bloc/bloc.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_event.dart';
import 'package:image_pcker/bloc/ToDoBloc/todo_state.dart';

class TodoBloc extends Bloc<TodoEvents,TodoState>{
  final  List<String> todosList=[];
  TodoBloc():super( const TodoState()){
    on<AddTodoTask>(_addTodoTasks);
    on<DeleteTodo>(_deleteTodo);
  }
void _addTodoTasks (AddTodoTask event,Emitter<TodoState> emit){
    todosList.add(event.task);
    emit(state.copyWith(todoList: List.from(todosList)));
}

void _deleteTodo (DeleteTodo event,Emitter<TodoState> emit){
    todosList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todosList)));
}
}