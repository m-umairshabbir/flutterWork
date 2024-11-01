import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  String? email;
  String? contact;
  String? cnic;
  String? name;
  String? token;
  UserModel(
      {required this.uid,
      required this.email,
      required this.contact,
      required this.cnic,
      required this.name,
      required this.token});
  UserModel.empty();
  factory UserModel.fromSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel(
      uid: doc.id,
      token: data['token'],
      email: data['email'],
      contact: data['contact'],
      cnic: data['cnic'],
      name: data['name'],
    );
  }
}
