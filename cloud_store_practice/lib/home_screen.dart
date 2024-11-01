import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 final FirebaseFirestore _fireStore=FirebaseFirestore.instance;

 void pickImage() async{
   ImagePicker picker=ImagePicker();
   XFile? xFile=await picker.pickImage(source: ImageSource.gallery);
   if(xFile!=null){
     File selectedImage=File(xFile.path);
     setState(() {
       pickedImage=selectedImage;
     });
     print("picked image from source gallery");
   }else{
     print("Image not Picked");
   }
 }
 Future<String> uploadImage()async{
   FirebaseStorage storage=FirebaseStorage.instance;
   UploadTask uploadTask=storage.ref().child("Profile Pictures").child(const Uuid().v1()).putFile(pickedImage!);
   TaskSnapshot taskSnapshot=await uploadTask;
   String downloadURL=await taskSnapshot.ref.getDownloadURL();
   return downloadURL;
 }
  void myFun(String name,String email,int age)async{
   String imageURL=await uploadImage();
    Map<String,dynamic> usersMap={
      "Name":name,
      "Email":email,
      "Age":age,
      "ProfilePicture":imageURL,
    };
    await _fireStore.collection('users').add(usersMap);

  }



  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cloud Firestore"),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             GestureDetector(
               onTap: (){
                pickImage();
               },
               child: Container(
                 width: 80, // Adjust to your desired size
                 height: 80,
                 decoration: BoxDecoration(
                   shape: BoxShape.circle,
                   color: Colors.grey[300],
                   image: pickedImage != null
                       ? DecorationImage(
                     image: FileImage(pickedImage!),
                     fit: BoxFit.scaleDown, // Ensures the image fills the circle
                   )
                       : null,
                 ),
                 child: pickedImage == null
                     ? const Icon(Icons.camera_alt, color: Colors.white, size: 30)
                     : null,
               ),
             ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: "Name",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                  labelText: "Age",
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32),
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                String name =nameController.text.trim();
                String email =emailController.text.trim();
                String strAge =ageController.text.trim();
                int age =int.parse(strAge);
                nameController.clear();
                emailController.clear();
                ageController.clear();
                myFun(name,email,age);
               setState(() {
                 pickedImage=null;
               });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text("Save"),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: _fireStore.collection('users').orderBy('Age').snapshots(),
                  builder:(context,snapshot){
                    if(snapshot.connectionState==ConnectionState.active){
                      if(snapshot.hasData && snapshot.data!=null){
                        return ListView.builder(
                            itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context,index){
                             Map<String,dynamic> userDataMap= snapshot.data!.docs[index].data() as Map<String,dynamic>;
                              return ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(userDataMap['ProfilePicture']),
                                ),
                                title: Text(userDataMap['Name']+"("+userDataMap['Age'].toString()+')',
                                ),
                                subtitle: Text(userDataMap['Email']),
                              );
                          },
                        );
                      }else{
                        return const Center(
                          child: Text("No Data!!"),
                        );
                      }
                    }else{
                      return const CircularProgressIndicator();
                    }
                  }
              
              ),
            )
          ],
        ),
      )),
    );
  }


}
