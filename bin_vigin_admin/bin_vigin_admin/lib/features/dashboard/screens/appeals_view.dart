// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

import 'package:bin_vigin_admin/features/users/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'package:bin_vigin_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/littering_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/models/littering_model.dart';
import 'package:bin_vigin_admin/features/dashboard/screens/dashboard_view.dart';
import 'package:bin_vigin_admin/features/users/controllers/users_controller.dart';
import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:bin_vigin_admin/utils/app_images.dart';
import 'package:bin_vigin_admin/utils/ui_helper.dart';
import 'package:url_launcher/url_launcher.dart' as url_launcher;

class AppealsView extends StatefulWidget {
  const AppealsView({super.key, required this.showBackButton});
  final bool showBackButton;

  @override
  State<AppealsView> createState() => _AppealsViewState();
}

class _AppealsViewState extends State<AppealsView> {
  bool isDetailPage = false;
  LitteringModel? selectedComplaint;
  int? selectedIndex;
  UserModel? selectedUser;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    return SizedBox(
      width: width * 0.7,
      child: Obx(() {
        final data = LitteringController.to.litteringList
            .where((p0) => p0.status == 2)
            .toList();

        final complaintsCount = data.length;
        return Column(children: [
          SizedBox(height: height * 0.02),
          // widget.showBackButton
          //     ? Align(
          //         alignment: Alignment.topLeft,
          //         child: IconButton(
          //             onPressed: () {
          //               Get.find<DashboardController>()
          //                   .navigateTo(const DashboardView());
          //             },
          //             icon: const Icon(Icons.arrow_back_ios)),
          //       )
          //     : const SizedBox.shrink(),
          SizedBox(
              height: height * 0.2,
              width: width * 0.2,
              child: Stack(children: [
                Positioned.fill(
                  child: Image(
                    image: AssetImage(AppImages.appealsBackground),
                    height: height * 0.2,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                    top: height * 0.11,
                    left: width * 0.02,
                    child: Text(
                      complaintsCount.toString(),
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    )),
              ])),
          SizedBox(height: height * 0.05),
          AnimatedContainer(
              height: height * 0.6,
              width: width * (isDetailPage ? 0.5 : 0.7),
              duration: const Duration(milliseconds: 500),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: AppColors.primaryLightColor,
                child: SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: isDetailPage
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isDetailPage = false;
                                            });
                                          },
                                          icon: const Icon(
                                            Icons.arrow_back_ios,
                                            color: Colors.white,
                                            size: 16,
                                          )),
                                    ),
                                    const Spacer(),
                                    const Text(
                                      "Appeal Details",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Spacer(),
                                    const SizedBox()
                                  ],
                                ),
                                SizedBox(height: height * 0.02),
                                Table(
                                  border: TableBorder.all(color: Colors.white),
                                  children: [
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Appeal Id",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${selectedIndex! + 1}",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "User Name",
                                          style: UIHelper.tableHeaderStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedUser!.name!,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "CNIC",
                                          style: UIHelper.tableHeaderStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedUser!.cnic!,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Contact",
                                          style: UIHelper.tableHeaderStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedUser!.contact!,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Date",
                                          style: UIHelper.tableHeaderStyle,
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedComplaint!.date,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "City",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedComplaint!.city,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Location",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedComplaint!.location,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Evidence File",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: TextButton(
                                            onPressed: () async {
                                              url_launcher.launch(
                                                  selectedComplaint!
                                                      .evidenceFile);
                                              // html.AnchorElement anchorElement =
                                              //     html.AnchorElement(
                                              //         href: selectedComplaint!
                                              //             .evidenceFile);
                                              // anchorElement.download =
                                              //     selectedComplaint!
                                              //         .evidenceFile;
                                              // anchorElement.click();
                                              // UIHelper.showToast(
                                              //     "Evidence file downloaded!");
                                            },
                                            child: const Text(
                                              "Download",
                                              textAlign: TextAlign.center,
                                            )),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Evidence of act",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedComplaint!.statement,
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                    TableRow(children: [
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Appeal Statement",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableHeaderStyle,
                                        ),
                                      )),
                                      TableCell(
                                          child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          selectedComplaint!.appealStatement ??
                                              "",
                                          textAlign: TextAlign.center,
                                          style: UIHelper.tableCellStyle,
                                        ),
                                      )),
                                    ]),
                                  ],
                                ),
                                SizedBox(height: height * 0.025),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('complaints')
                                              .doc(selectedComplaint!.id)
                                              .update({"status": 3});
                                          setState(() {
                                            isDetailPage = false;
                                            selectedComplaint = null;
                                            selectedUser = null;
                                            selectedIndex = null;
                                          });
                                          UIHelper.showToast(
                                              "Appeal accepted successfully!");
                                        },
                                        child: const Text(
                                          "Accept",
                                          style: TextStyle(color: Colors.green),
                                        )),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    ElevatedButton(
                                        onPressed: () {
                                          FirebaseFirestore.instance
                                              .collection('complaints')
                                              .doc(selectedComplaint!.id)
                                              .update({"status": 0});
                                          setState(() {
                                            isDetailPage = false;
                                            selectedComplaint = null;
                                            selectedUser = null;
                                            selectedIndex = null;
                                          });
                                          UIHelper.showToast(
                                              "Appeal rejected successfully!");
                                        },
                                        child: const Text("Reject",
                                            style:
                                                TextStyle(color: Colors.red)))
                                  ],
                                ),
                                SizedBox(height: height * 0.025),
                              ],
                            )
                          : ComplaintsList(
                              data: data,
                              onViewDetails: (model, index) {
                                setState(() {
                                  selectedIndex = index;
                                  selectedComplaint = model;
                                  selectedUser = UsersController.to.users
                                      .where((p0) =>
                                          p0.uid == selectedComplaint!.uid!)
                                      .first;
                                  isDetailPage = true;
                                });
                              })),
                ),
              ))
        ]);
      }),
    );
  }
}

class ComplaintsList extends StatelessWidget {
  const ComplaintsList(
      {super.key, required this.data, required this.onViewDetails});
  final List<LitteringModel> data;
  final Function(LitteringModel, int) onViewDetails;
  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.26,
              ),
              child: const Text(
                "No appeal yet!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        : Table(children: [
            TableRow(children: [
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Appeal Id",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Date",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("City",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Location",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Action",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              ))
            ]),
            ...data.map((e) => TableRow(
                  children: [
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${data.indexOf(e) + 1}",
                              textAlign: TextAlign.center,
                              style: UIHelper.tableCellStyle),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.date,
                              textAlign: TextAlign.center,
                              style: UIHelper.tableCellStyle),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.city,
                              textAlign: TextAlign.center,
                              style: UIHelper.tableCellStyle),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(e.location,
                              textAlign: TextAlign.center,
                              style: UIHelper.tableCellStyle),
                        )),
                    TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: TextButton(
                                  onPressed: () {
                                    onViewDetails(e, data.indexOf(e));
                                  },
                                  child: const Text("View Details")),
                            )))
                  ],
                ))
          ]);
  }
}