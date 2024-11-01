import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sparkler/Widgets/OnBoardingScreen/custom_boarding.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController pageController = PageController();

  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (index){
              currentPageIndex=index;
              setState(() {

              });
            },
            children: const [
              OnBoardingElement(
                imageName: "assets/sc1.jpg",
                heading: "We need to word hard",
                subHeading:
                    "Hard work is the consistent effort and dedication you put into achieving your goals, even when challenges arise. It builds character, resilience, and brings long-term success through perseverance.",
              ),
              OnBoardingElement(
                imageName: "assets/sc2.jpg",
                heading: "We need to word hard",
                subHeading:
                    "Hard work is the consistent effort and dedication you put into achieving your goals, even when challenges arise. It builds character, resilience, and brings long-term success through perseverance.",
              ),
              OnBoardingElement(
                imageName: "assets/sc3.jpg",
                heading: "We need to word hard",
                subHeading:
                    "Hard work is the consistent effort and dedication you put into achieving your goals, even when challenges arise. It builds character, resilience, and brings long-term success through perseverance.",
              ),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  SmoothPageIndicator(
                    controller: pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.yellow, // Active indicator color
                      dotColor: Colors.grey,
                      expansionFactor: 2, // Inactive indicator color
                      dotHeight: 10,
                      dotWidth: 10,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if(currentPageIndex<2) {
                          pageController.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.linear);
                        }else{
                          Navigator.pushReplacementNamed(context, "SignUp");
                        }
                      },
                      child: currentPageIndex==2?Text("Finish",style: TextStyle(fontSize: 18,
                      color:Colors.black.withOpacity(0.5),
                                        )) : Text("Next",style: TextStyle(fontSize: 18,
                      color:Colors.black.withOpacity(0.5),
                      ),)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
