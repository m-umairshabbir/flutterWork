import 'package:flutter/material.dart';

class UiHelper {
  static customTextField(TextEditingController controller, String text,
      IconData iconData, bool toHide,Color colour) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: TextField(
        controller: controller,
        obscureText: toHide,
        decoration: InputDecoration(
          hintText: text,
          suffixIcon: Icon(iconData,color: colour,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }

  static customButton(VoidCallback voidCallBack, String text) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: () {
          voidCallBack();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
    );
  }
  static customAlertBox(BuildContext context,String text){
    return showDialog(context: context, builder: (BuildContext context)
    {
      return AlertDialog(
        title: Text(text),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: Text('Ok'))
        ],
      );
    }
    );
  }
}
