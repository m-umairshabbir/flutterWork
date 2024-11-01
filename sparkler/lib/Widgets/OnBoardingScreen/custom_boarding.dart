
import 'package:flutter/material.dart';

class OnBoardingElement extends StatelessWidget {
  const OnBoardingElement({
    super.key,  this.heading="Heading",this.subHeading="Heading",required this.imageName
  });
  final String heading;
  final String subHeading;
  final String imageName;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(imageName),
      Text(heading ,style:const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 25
      ),),
    Text(subHeading,style: TextStyle(
    color: Colors.black.withOpacity(0.4),
    fontWeight: FontWeight.w300,
    fontSize: 16,
    ),
    textAlign: TextAlign.center,
    )
    ],
    ),
    );
  }
}
