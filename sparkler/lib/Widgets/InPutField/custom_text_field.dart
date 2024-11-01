
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? label;
  final String? hint;
  final IconData? icon;
  final int? fieldLength;
  final bool isObscure;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const CustomTextField({
    super.key,this.isObscure=false,this.label='',this.icon,this.hint='',this.keyboardType= TextInputType.emailAddress, required this.controller, this.fieldLength
  });
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: fieldLength,
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      cursorColor: Colors.orange,
      cursorHeight: 15,
      decoration: InputDecoration(
          suffixIcon: Icon(icon,color: Colors.grey,),
          labelText: label,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400),
          floatingLabelBehavior: FloatingLabelBehavior.auto,
          labelStyle: const TextStyle(
              color: Colors.grey, fontSize: 18),
          contentPadding:
          const EdgeInsets.symmetric(horizontal: 20),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide:
              BorderSide(color: Colors.grey.shade600)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
              borderSide: BorderSide(
                  color: Colors.grey.shade700,
                  style: BorderStyle.solid))),
    );
  }
}
