import 'set-and-compare.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/material.dart';
class QuestionContainer {
  late int _questionNumber = 0;
  List<Questions> questionList = <Questions>[
    Questions("You can become a coder if you only play cricket", false),
    Questions("Everyone can become a coder", true),
    Questions("Coding is a game of mind", true),
    Questions("Keep learning even if you master Flutter", true),
    Questions("Flutter is outdated", false),
  ];

  String displayQuestion() {
    if (_questionNumber < questionList.length) {
      return questionList[_questionNumber].question;
    }
    return "";
  }

  bool checkAnswer(bool userPickedCheck) {
    if (questionList[_questionNumber].answer == userPickedCheck) {
      return true;
    }
    return false;
  }

  void nextQuestion(BuildContext context, Function resetQuiz) {
    if (_questionNumber < questionList.length - 1) {
      _questionNumber++;
    } else {
      Alert(
        context: context,
        title: "Quiz Completed",
        desc: "You have completed the quiz!",
        buttons: [
          DialogButton(
            onPressed: () {
              resetQuiz();
              Navigator.pop(context);
            },
            width: 120,
            child: const Text(
              "Restart",
              style: TextStyle(color: Colors.black, fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            ),
            color: Colors.white,


          )
        ],
        style:AlertStyle(
          backgroundColor: Colors.teal,
        )
      ).show();
    }
  }

  void resetQuestionNumber() {
    _questionNumber = 0;

  }
}
