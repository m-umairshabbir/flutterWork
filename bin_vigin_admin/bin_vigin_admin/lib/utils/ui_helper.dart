import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:toastification/toastification.dart';

class UIHelper {
  static void showSnackbar(String title, String message) {
    Get.snackbar(title, message);
  }

  static TextStyle tableHeaderStyle = const TextStyle(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle tableCellStyle =
      const TextStyle(fontSize: 14, color: Colors.white);
  static void showToast(String message) {
    toastification.show(
      context: Get.context,
      type: ToastificationType.success,
      style: ToastificationStyle.flat,
      autoCloseDuration: const Duration(seconds: 5),
      description: RichText(text: TextSpan(text: message)),
      alignment: Alignment.topRight,
      direction: TextDirection.ltr,
      // animationDuration: const Duration(milliseconds: 300),
      // animationBuilder: (context, animation, alignment, child) {
      //   return FadeTransition(
      //     opacity: animation,
      //     child: child,
      //   );
      // },
      icon: const Icon(Icons.check),
      primaryColor: AppColors.primaryColor,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(12),
      boxShadow: const [
        BoxShadow(
          color: Color(0x07000000),
          blurRadius: 16,
          offset: Offset(0, 16),
          spreadRadius: 0,
        )
      ],
      // showProgressBar: true,
      closeButtonShowType: CloseButtonShowType.onHover,
      closeOnClick: false,
      pauseOnHover: true,
      dragToClose: true,
      applyBlurEffect: true,
    );
  }

  static void showLoading() {
    EasyLoading.show();
  }

  static void dismissLoading() {
    if (EasyLoading.isShow) {
      EasyLoading.dismiss();
    }
  }
}
