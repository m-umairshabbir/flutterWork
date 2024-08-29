import 'package:flutter/material.dart';
import 'package:bmi_calculator/widgets/constants.dart';

class IconContent extends StatelessWidget {


  final IconData? icon;
  final String? label;

  const IconContent({super.key,  this.icon,  this.label});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: Colors.white,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(label!,
          style: labelTextStyle,

          ),
      ],
    );
  }
}
