import 'package:flutter/material.dart';
import 'package:my_todo_list/Model/tasks_model.dart';
import 'package:provider/provider.dart';

import '../Model/task_data.dart';
import 'custom_task_tile.dart';
class CustomListView extends StatelessWidget {
  const CustomListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: ( context, taskData, Widget? child) {
        return  ListView.builder(
            itemBuilder: (context,index){
              final task=taskData.tasks[index];
              return CustomTaskTile(
                taskTitle: task.name,
                isChecked:task.isDone,
                checkboxCallBack:(checkboxState){
                  taskData.updateTask(task);
                }, longPressCallBack: (){
                  taskData.deleteTask(task);
              },
              );
            },
            itemCount: Provider.of<TaskData>(context).taskCount,
            );
      },
    );
  }
}
