import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  // Declare the properties for customization
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final double? borderRadius;
  final EdgeInsetsGeometry? padding;
  final double? textSize;

  // Constructor to initialize the properties
  CustomElevatedButton({
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.blue, // Default color
    this.textColor = Colors.white, // Default text color
    this.borderRadius = 25.0, // Default border radius
    this.padding = const EdgeInsets.all(16.0), // Default padding
    this.textSize = 16.0, // Default text size
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 5,
        backgroundColor: backgroundColor, // Button background color
        padding: padding, // Button padding
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!), // Border radius
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          color: textColor, // Text color
          fontSize: textSize, // Text size
        ),
      ),
    );
  }
}


////////////

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final Icon prefixIcon;
  final bool isObscure;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final String? suffixText;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.prefixIcon,
    this.isObscure = false,
    this.keyboardType = TextInputType.text,
    this.suffixIcon,
    this.suffixText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure,
      keyboardType: keyboardType,
      cursorColor: Colors.blueAccent,
      style: const TextStyle(color: Colors.grey, fontSize: 20),
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffixText: suffixText,
        suffixStyle: TextStyle(color: Colors.green,fontSize: 15),
        hintStyle: const TextStyle(color: Colors.grey),
        labelStyle: const TextStyle(
          letterSpacing: 2,
          color: Colors.grey,
          fontSize: 20,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: Colors.blueAccent,
            width: 2,
          ),
        ),
      ),
    );
  }
}
