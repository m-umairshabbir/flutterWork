import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:math';
void main() {
  runApp(const LuddoRoller());
}

class LuddoRoller extends StatelessWidget {
  const LuddoRoller({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int leftDiceNo=3;
  int rightDiceNo=5;
  Future<void> soundPlayer()async{
    final player=AudioPlayer();
    await player.play(AssetSource('diceSound.mp3'));
  }

  void leftDiceChanger(){
    leftDiceNo=Random().nextInt(6)+1;
    setState(() {
      soundPlayer();
      if(leftDiceNo==6){
      rightDiceChanger();
    }

    });
  } void rightDiceChanger(){
    setState(() {
      soundPlayer();
      rightDiceNo=Random().nextInt(6)+1;
      if(rightDiceNo==6){
        leftDiceChanger();
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Dice Roller",
          style: TextStyle(
            color: Colors.orange,
            fontSize: 30,
            fontFamily: 'Pacifico',
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Row(
            children: [

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                          child: Image.asset('images/dice-$leftDiceNo.png',),

                      ),
                      onPressed: () {
                        leftDiceChanger();
                      }
                      ),
                  
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: () {
                      rightDiceChanger();
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:BorderRadius.circular(20.0)
                        ),
                        child: Image.asset('images/dice-$rightDiceNo.png'),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
