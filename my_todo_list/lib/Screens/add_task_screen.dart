import 'package:flutter/material.dart';
import 'package:my_todo_list/Model/task_data.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {

   AddTaskScreen({super.key});
   final addTaskController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        decoration:const BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
          topRight: Radius.circular(20)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 20),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Add Task',style: TextStyle(
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.w700,
                fontSize: 40,
              ),),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorHeight: 20,
                cursorColor: Colors.lightBlueAccent,
                keyboardType: TextInputType.text,
                controller:addTaskController,
                style: const TextStyle(
                  color: Colors.grey
                ),
                textAlign: TextAlign.center,
                decoration:  const InputDecoration(

                  labelText: 'AddTask',
                  labelStyle: TextStyle(color: Colors.lightBlueAccent),
                  floatingLabelBehavior: FloatingLabelBehavior.auto,
                  hintText: 'Add task here!',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    textBaseline: TextBaseline.alphabetic
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    )
                  ) ,
                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.blue
                    ),
                  )

                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: (){
                final String taskText=addTaskController.text;
                Provider.of<TaskData>(context,listen: false).addTask(taskText);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                minimumSize:const Size(200, 50) ,
                backgroundColor: Colors.lightBlueAccent,
              ), child:const Text('Add',
              style: TextStyle(color: Colors.white),),
              )

            ],
          ),
        ),
      ),
    );
  }
}
