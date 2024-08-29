import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {
  const BMIResult(
      {super.key,
      required this.bmiResult,
      required this.bmiInterpretation,
      required this.bmiStatus});

  final String bmiResult;
  final String bmiInterpretation;
  final String bmiStatus;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: inActiveCardColor,
      appBar: AppBar(
        title: Text('Bmi Calculator'),
        centerTitle: true,
        backgroundColor: inActiveCardColor,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ReusableCards(
              colour:inActiveCardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: Text(
                      "Your Results",
                      style: numberTextStyle,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ReusableCards(
                        colour:  Color(0xFF8D8E98),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmiStatus.toUpperCase(),style: resultTextStyle,),
                        Text(bmiResult.toUpperCase(),style: bmiTextStyle,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(bmiInterpretation,style: bodyTextStyle,
                          textAlign: TextAlign.center,),
                        ),
                      ],
                    ),
                    ),
                  ),
                  BottomButton(onTap: (){
                    Navigator.pop(context);
                  }, buttonTitle: 'Re-Calculate',
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
