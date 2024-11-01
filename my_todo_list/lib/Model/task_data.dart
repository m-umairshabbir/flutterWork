import 'package:flutter/foundation.dart';
import 'tasks_model.dart';
import 'dart:collection';
import 'package:flutter/material.dart';
class TaskData extends ChangeNotifier{

  final List<Task> _tasks=[
    Task(name: 'Sell Laptop'),
    Task(name: 'Purchase Macbook'),
    Task(name: 'Enjoy Have fun!'),
  ];

  int get taskCount{
    return _tasks.length;
  }

  UnmodifiableListView<Task> get tasks{
    return UnmodifiableListView(_tasks);
  }

  void updateTask(Task task){
    task.toggleDone();
    notifyListeners();
  }
  void addTask(String newTaskTitle){
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }
}