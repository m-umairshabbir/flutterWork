import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable{
  const TodoEvents();
}

class AddTodoTask extends TodoEvents{
  final String task;

 const  AddTodoTask({required this.task});
  @override
  List<Object?> get props =>  [task];

}

class DeleteTodo extends TodoEvents{
  final Object task;
 const DeleteTodo({required this.task});

  @override
  List<Object?> get props => [];

}