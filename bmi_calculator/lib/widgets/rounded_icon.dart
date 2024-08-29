import 'package:flutter/material.dart';

class RoundedIcon extends StatelessWidget {
  const RoundedIcon({super.key, required this.onPressed, required this.icon});

  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        elevation: 6,
        constraints: const BoxConstraints.tightFor(
          width: 50,
          height: 50,
        ),
        onPressed: onPressed,
      child: Icon(icon,color: Colors.white,),

    );
  }
}
