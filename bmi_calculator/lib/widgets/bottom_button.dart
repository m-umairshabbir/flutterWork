import 'package:flutter/material.dart';

import 'constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({super.key, required this.onTap, required this.buttonTitle});
  
  final VoidCallback onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: bottomContainerHeight,
        width: double.infinity,
        color: bottomContainerColor,
        margin: const EdgeInsets.only(top: 15),
        padding: const EdgeInsets.all(10),
        child: Center(child: Text(buttonTitle,style: largeButtonTextStyle,)),
      ),
    );
  }
}
