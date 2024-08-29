import 'package:bmi_calculator/Screens/bmi_result.dart';
import 'package:bmi_calculator/widgets/bottom_button.dart';
import 'package:bmi_calculator/widgets/constants.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:bmi_calculator/widgets/icon_content.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/rounded_icon.dart';
import 'package:bmi_calculator/calculate_bain.dart';


enum Gender {
  male,
  female,
}

int height = 152;
int weight = 60;
int age=10;
class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:kactiveCardColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xFF0F101D),
        title: const Text(
          'BMI Calculator',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ReusableCards(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: "Male",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCards(
                    onPressed: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? activeCardColor
                        : inActiveCardColor,
                    cardChild: const IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: "FEMALE",
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: ReusableCards(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Height',
                          style: labelTextStyle,
                        ),
                        Row(
                            textBaseline: TextBaseline.alphabetic,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                height.toString(),
                                style: numberTextStyle,
                              ),
                              const Text('cm', style: labelTextStyle)
                            ]),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.white,
                            inactiveTrackColor: const Color(0xFF8D8E98),
                            thumbColor: const Color(0xFFEB1555),
                            overlayColor: const Color(0x29Eb1555),
                            thumbShape:
                                const RoundSliderThumbShape(enabledThumbRadius: 15),
                            overlayShape:
                                const RoundSliderOverlayShape(overlayRadius: 30),
                          ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: ReusableCards(
                  colour: inActiveCardColor,
                  cardChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(weight.toString(),style: numberTextStyle,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedIcon(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              if (weight!=1){
                                setState(() {
                                  weight--;
                                });
                              }
                            },

                          ),
                           RoundedIcon(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                  child: ReusableCards(colour: inActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("AGE",style: labelTextStyle,),
                      Text(age.toString(),style: numberTextStyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          RoundedIcon(onPressed: (){
                            if(age!=1){
                              setState(() {
                                age--;
                              });
                            }
                          }, icon: FontAwesomeIcons.minus),
                          RoundedIcon(onPressed: (){
                            setState(() {
                              age++;
                            });
                          }, icon: FontAwesomeIcons.plus),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ],
            ),
             BottomButton(
               buttonTitle: "Calculate",
              onTap: (){
                 CalculationBrain cal=CalculationBrain(height: height,weight: weight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BMIResult(
                  bmiResult:cal.calculateBMI() ,
                  bmiStatus: cal.getResult(),
                  bmiInterpretation: cal.getInterpretation(),
                )));
              },

            ),
          ],
        ),
      ),
    );
  }
}
