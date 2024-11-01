import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_prctice/screens/landing_screen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../ui_helper.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  TextEditingController message = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
   User? loggedInUser;
  bool loader = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  //identification of current user
  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {}
  }

  Future<void> sendMessage() async {
    await _firestore.collection('messages').add(<String, dynamic>{
      'sender': loggedInUser?.email,
      'text': message.text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
  // Built build\app\outputs\bundle\release\app-release.aab
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
        title: const Text('⚡ Chat'),
        centerTitle: true,

        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.popAndPushNamed(context, LandingScreen.id);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BubbleStream(firestore: _firestore, loggedInUser: loggedInUser),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: message,
                    labelText: 'Message',
                    hintText: 'Enter your text here!',
                    prefixIcon: const Icon(Icons.message),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {
                    sendMessage();
                    setState(() {
                      message.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.send_sharp,
                    color: Colors.blue,
                    size: 30,
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}

class BubbleStream extends StatelessWidget {
  const BubbleStream({
    super.key,
    required FirebaseFirestore firestore,
    required this.loggedInUser,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;
  final dynamic loggedInUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final messages = snapshot.data!.docs.reversed;
          List<Widget> messageWidgets = [];
          for (var message in messages) {
            final messageData = message.data() as Map<String, dynamic>;

            // Check if the 'text' and 'sender' fields exist in the document
            final messageText = messageData.containsKey('text')
                ? messageData['text']
                : 'No message';
            final messageSender = messageData.containsKey('sender')
                ? messageData['sender']
                : 'Unknown sender';

            final currentUser = loggedInUser.email;

            final messageWidget = MessageBubble(
                messageSender: messageSender,
                messageText: messageText,
                isMe: currentUser == messageSender);
            messageWidgets.add(messageWidget);
          }

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                children: messageWidgets,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('No data available'));
        }
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({
    super.key,
    required this.messageSender,
    required this.messageText,
    required this.isMe,
  });

  final dynamic messageSender;
  final dynamic messageText;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: isMe?CrossAxisAlignment.end:CrossAxisAlignment.start,
      children: [
        Text(
          '$messageSender',
          style: const TextStyle(color: Colors.grey, fontSize: 15),
        ),
        const SizedBox(
          height: 5,
        ),
        Material(
            borderRadius: isMe? const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20)):
            const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))
            ,


            color: isMe?Colors.blueAccent:Colors.white,
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                '$messageText',
                style: TextStyle(color: isMe?Colors.white:Colors.black, fontSize: 20),
              ),
            )),
      ],
    );
  }
}
