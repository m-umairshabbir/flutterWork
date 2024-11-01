import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  const BasicAppButton({super.key, required this.text, required this.callBack,this.height});
  final String text;
  final VoidCallback callBack;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: callBack, child: Text(text,style: TextStyle(color: Colors.white),),
    style: ElevatedButton.styleFrom(
      elevation: 5,
      minimumSize: Size.fromHeight(height ??80),
    ),);
  }
}
