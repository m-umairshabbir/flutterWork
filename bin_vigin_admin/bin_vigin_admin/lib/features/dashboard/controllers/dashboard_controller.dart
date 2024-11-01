import 'package:bin_vigin_admin/features/dashboard/screens/appeals_view.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/complaints_view.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/dashboard_view.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/fines_view.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/real_time_monitoring_view.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardController extends GetxController {
  final SidebarXController sidebarXController =
      SidebarXController(selectedIndex: 0);

  @override
  void onInit() {
    sidebarXController.addListener(() {
      update();
    });
    super.onInit();
  }

  @override
  void onClose() {
    sidebarXController.removeListener(() {});
    super.onClose();
  }

  final dashboardItems = [
    const DashboardView(),
    const RealTimeMonitoringView(showBackButton: false),
    const ComplaintsView(showBackButton: false),
    const FinesView(showBackButton: false),
    const AppealsView(showBackButton: false)
  ];
  // void navigateTo(Widget widget) {
  //   dashboardItems[0] = widget;
  //   update();
  // }
}
