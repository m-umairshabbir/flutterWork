import 'package:flutter/material.dart';

class CustomTaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function longPressCallBack;

  final Function checkboxCallBack;
  // final Function toggleCheckBoxState;
  const CustomTaskTile({super.key,this.isChecked=false, required this.taskTitle, required  this.checkboxCallBack, required this.longPressCallBack});
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: (){
        longPressCallBack();
      },
      title: Text(taskTitle,style: TextStyle(
        decoration: isChecked?TextDecoration.lineThrough:null,
      ),),
      trailing:Checkbox(
        value: isChecked,
        onChanged: (bool? newValue){
          checkboxCallBack(newValue);
        },
        activeColor: Colors.lightBlueAccent,
      ),
    );
  }
}
