import 'package:flutter/material.dart';
void main() {
  runApp( PersoniaCard());
}
class PersoniaCard extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.brown.shade900,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 10,
                  )
                ]
              ),
              child: const CircleAvatar(
                backgroundImage: AssetImage('images/umSavour.jpg'),
                radius: 50,
              ),
            ),
            Text("Umair Shabbir",
            style: TextStyle(
              fontSize: 40,
              letterSpacing: 2.5,
              fontFamily: 'GreyQo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            ),
            Text("Flutter Developer",
            style: TextStyle(
              color: Colors.teal.shade50,
              fontSize: 20,
              fontFamily: 'SourceSanPro'
            ),
            ),
             SizedBox(
              child: Divider(
                height: 10,
                color: Colors.teal.shade50,

              ),
               width: 120,
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                leading: Icon(Icons.phone,
                  color: Colors.brown.shade900,
                ),
                title: Text("+923008342787",
                style: TextStyle(
                  letterSpacing: 2.5,
                  color: Colors.brown.shade900
                ),
                ),

              ),
            ),
            Card(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 50),
              child: ListTile(
                contentPadding: EdgeInsets.only(left: 20),
                leading: Icon(Icons.email,
                  color: Colors.brown.shade900,
                ),
                title: Text("theumair3191@gmail.com",
                  style: TextStyle(
                      color: Colors.brown.shade900
                  ),
                ),

              ),
            )
          ],
        )),
      ),
    );
  }
}
