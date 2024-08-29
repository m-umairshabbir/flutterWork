import 'package:flutter/material.dart';

void main() {
  runApp( DiceRoller());
}
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }


class _DiceRollerState extends State<DiceRoller> {
  @override
  Widget build(BuildContext context) {
    var leftSideNo=1;
    var rightSideNo=1;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar:AppBar(
          title: const Text("Dice Roller",
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue,
          elevation: 4.0,
        ),

        body: Center(
          child: Container(
            color:Colors.blue,
            child: Row(

              children: [
                Expanded(child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextButton(
                    onPressed: (){

                      leftSideNo=2;
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0)
                        ),
                        child: Image.asset('images/dice-$rightSideNo.png')),),
                ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(

                      onPressed: (){
                      },
                      child: Container(

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),

                          padding: const EdgeInsets.all(0),
                          child: Image.asset('images/dice-$rightSideNo.png')),),
                  ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



