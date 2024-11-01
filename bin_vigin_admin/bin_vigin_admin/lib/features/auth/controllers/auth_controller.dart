import 'package:bin_vigin_admin/features/auth/screens/login_screen.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/littering_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/dashboard_screen.dart';
import 'package:bin_vigin_admin/features/users/controllers/users_controller.dart';
import 'package:bin_vigin_admin/utils/ui_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  static AuthController to = Get.find();
  User? user;
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      firebaseAuth.authStateChanges().listen((user) {
        if (user != null) {
          this.user = user;
          // ProfileController.to.getUserData(user.uid);
          // LitteringController.to.getLitteringList();
          Get.offAll(() => const DashboardScreen());
          LitteringController.to.getLitteringList();
          UsersController.to.getUsers();
        } else {
          user = null;
          Get.offAll(() => LoginScreen());
        }
      });
    });

    super.onInit();
  }

  Future<void> signOut() async {
    try {
      UIHelper.showLoading();
      await firebaseAuth.signOut();
    } catch (e) {
      UIHelper.showToast(
        "Error Signing out!",
      );
    } finally {
      UIHelper.dismissLoading();
    }
  }
}
