import 'package:equatable/equatable.dart';

class TodoStates extends Equatable{

final List<String> todoList;

 const TodoStates({this.todoList=const[]});

 TodoStates copyWith ({List<String>? todoList}){
   return TodoStates(todoList: todoList ?? this.todoList);
 }
  @override
  List<Object?> get props => [todoList];

}