import 'package:bin_vigin_admin/features/users/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class UsersController extends GetxController {
  final users = <UserModel>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static UsersController to = Get.find();

  void getUsers() {
    firestore.collection('users').snapshots().listen((value) {
      users.value = value.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    });
  }
}
