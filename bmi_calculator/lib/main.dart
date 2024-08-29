import 'package:flutter/material.dart';
import 'package:bmi_calculator/Screens/input_page.dart';
void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:InputPage(),

    );
  }
}

