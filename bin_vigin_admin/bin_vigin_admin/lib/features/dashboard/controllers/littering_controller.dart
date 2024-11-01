import 'package:bin_vigin_admin/features/dashboard/models/littering_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class LitteringController extends GetxController {
  final litteringList = <LitteringModel>[].obs;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  static LitteringController to = Get.find();

  void getLitteringList() {
    firestore.collection('complaints').snapshots().listen((value) {
      litteringList.value = value.docs
          .map((e) => LitteringModel.fromJson(e.data())..id = e.id)
          .toList();
      sortLitteringModelsByDate();
    });
  }

  void sortLitteringModelsByDate() {
    litteringList.sort((a, b) => b.parsedDate.compareTo(a.parsedDate));
  }
}
