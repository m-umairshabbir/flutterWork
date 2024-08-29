import 'package:flutter/material.dart';
class ReusableCards extends StatelessWidget {
  const ReusableCards({super.key, required this.colour,this.cardChild, this.onPressed});

  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 200,
        width: 170,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
        child: cardChild,
      ),
    );
  }
}
