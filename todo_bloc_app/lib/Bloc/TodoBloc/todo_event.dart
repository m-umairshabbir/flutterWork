import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable{

}

class AddTaskEvent extends TodoEvents{
  @override
  List<Object?> get props => [];
}

class RemoveTaskEvent extends TodoEvents{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}