import 'package:flutter/material.dart';
import 'bank.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}
List<Icon> checkIcons = [];
class _QuizPageState extends State<QuizPage> {
  QuestionContainer obj = QuestionContainer();


  void createIcon(bool userPickedCheck) {
    bool correctAnswer = obj.checkAnswer(userPickedCheck);

    if (correctAnswer) {
      checkIcons.add(
        Icon(
          Icons.check,
          color: Colors.teal.shade700,
          size: 30,
        ),
      );
    } else {
      checkIcons.add(
        Icon(
          Icons.close_outlined,
          color: Colors.red.shade900,
          size: 30,
        ),
      );
    }

    setState(() {
      obj.nextQuestion(context, resetQuiz);
    });
  }

  void resetQuiz() {
    setState(() {
      checkIcons.clear();
      obj.resetQuestionNumber();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  Padding(
            padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/quiz_3407038.png"),

        ),
        title: Text(
          "Quizzler",
          style: TextStyle(
            fontSize: 30,
            color: Colors.teal.shade900,
            fontFamily: 'Pacifico',
          ),
        ),

        backgroundColor: Colors.blue.shade50,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  obj.displayQuestion(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.teal.shade900,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            createIcon(true);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.teal.shade50,
                          backgroundColor: Colors.teal.shade900,
                        ),
                        child: const Text(
                          'True',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            createIcon(false);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.teal.shade50,
                          backgroundColor: Colors.red.shade900,
                        ),
                        child: const Text(
                          'False',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: checkIcons,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
