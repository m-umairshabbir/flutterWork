import 'package:bin_vigin_admin/features/auth/controllers/auth_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/littering_controller.dart';
import 'package:bin_vigin_admin/features/users/controllers/users_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(LitteringController(), permanent: true);
    Get.put(DashboardController(), permanent: true);
    Get.put(UsersController(), permanent: true);
  }
}
