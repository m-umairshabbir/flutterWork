import 'package:bin_vigin_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/littering_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/complaint_barchart.dart';
import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:bin_vigin_admin/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sidebarx/sidebarx.dart';
import 'package:table_calendar/table_calendar.dart';

class DashboardScreen extends GetView<DashboardController> {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SidebarX(
          showToggleButton: false,
          theme: SidebarXTheme(
            width: 75,
            padding: const EdgeInsets.only(top: 70),
            itemPadding:
                const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
            selectedItemPadding:
                const EdgeInsets.only(left: 10, right: 25, top: 10, bottom: 10),
            decoration: BoxDecoration(
                color: AppColors.primaryLightColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40))),
            selectedItemMargin:
                const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            selectedItemDecoration: const BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(6),
                    bottomLeft: Radius.circular(6))),
            itemMargin: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            selectedIconTheme: const IconThemeData(color: Colors.white),
            iconTheme: const IconThemeData(color: Colors.grey),
          ),
          controller: controller.sidebarXController,
          items: [
            const SidebarXItem(
              icon: Icons.home,
              
            ),
            SidebarXItem(
              iconBuilder: (selected, hovered) {
                return Image.asset(
                  selected || hovered
                      ? AppImages.monitorWhiteIcon
                      : AppImages.monitorBlackIcon,
                  height: 30,
                );
              },
            ),
            SidebarXItem(
              iconBuilder: (selected, hovered) {
                return Image.asset(
                  selected || hovered
                      ? AppImages.complaintWhiteIcon
                      : AppImages.complaintBlackIcon,
                  height: 30,
                );
              },
            ),
            SidebarXItem(
              iconBuilder: (selected, hovered) {
                return Image.asset(
                  selected || hovered
                      ? AppImages.fineWhiteIcon
                      : AppImages.fineBlackIcon,
                  height: 30,
                );
              },
            ),
            SidebarXItem(
              iconBuilder: (selected, hovered) {
                return Image.asset(
                  selected || hovered
                      ? AppImages.appealWhiteIcon
                      : AppImages.appealBlackIcon,
                  height: 30,
                );
              },
            ),
          ],
        ),
        GetBuilder<DashboardController>(builder: (controller) {
          return controller
              .dashboardItems[controller.sidebarXController.selectedIndex];
        }),
        Container(
          width: width * 0.18,
          margin: EdgeInsets.symmetric(vertical: height * 0.08),
          height: height,
          decoration: BoxDecoration(
              color: AppColors.primaryLightColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20))),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: -55,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      width: 70,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white,
                            width: 5,
                          )),
                      child: const Icon(
                        Icons.person,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Admin",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.all(8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: width * 0.16,
                          height: 265,
                          child: TableCalendar(
                            firstDay: DateTime.utc(2010, 10, 16),
                            lastDay: DateTime.now(),
                            rowHeight: 30,
                            calendarStyle: const CalendarStyle(
                                todayTextStyle: TextStyle(fontSize: 12),
                                outsideTextStyle: TextStyle(fontSize: 12),
                                weekendTextStyle: TextStyle(fontSize: 12),
                                defaultTextStyle: TextStyle(fontSize: 12)),
                            focusedDay: DateTime.now(),
                            weekNumbersVisible: false,
                            headerStyle:
                                const HeaderStyle(formatButtonVisible: false),
                          ),
                        ),
                      ),
                    ),
                    Obx(() {
                      final data = LitteringController.to.litteringList.value;
                      return SizedBox(
                        width: width * 0.16,
                        height: 265,
                        child: ComplaintBarChart(
                          litteringList: data,
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
