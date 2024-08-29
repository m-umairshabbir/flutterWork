import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyAudioPlayer(),
    );
  }
}

class MyAudioPlayer extends StatefulWidget {
  const MyAudioPlayer({super.key});

  @override
  State<MyAudioPlayer> createState() => _MyAudioPlayerState();
}

class _MyAudioPlayerState extends State<MyAudioPlayer> {
  final player = AudioPlayer();
  Future<void> playSound(int soundNo) async {
    String audioPath = "note$soundNo.wav";
    await player.play(AssetSource(audioPath));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("XyloPhone"),
        leading: Icon(Icons.play_circle_fill_outlined,
        size: 40,
        ),
      ),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(1);
                    },
                    child: Text(''),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green, // Background color of the button
                               // Text color of the button
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(2);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,)
                
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(3);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,)
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(4);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,)
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(5);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink,)
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                      width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(6);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,)
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      playSound(7);
                    },
                    child: Text(''),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,)
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
