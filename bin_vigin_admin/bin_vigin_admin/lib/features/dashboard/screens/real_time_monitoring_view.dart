import 'dart:developer';

import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:bin_vigin_admin/utils/ui_helper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:bin_vigin_admin/utils/app_images.dart';
import 'package:flutter/widgets.dart';
import 'package:video_player/video_player.dart';

class RealTimeMonitoringView extends StatefulWidget {
  const RealTimeMonitoringView({super.key, required this.showBackButton});
  final bool showBackButton;
  @override
  State<RealTimeMonitoringView> createState() => _ComplaintsViewState();
}

class _ComplaintsViewState extends State<RealTimeMonitoringView> {
  late VideoPlayerController video1Controller;
  late VideoPlayerController video2Controller;
  late VideoPlayerController video3Controller;
  late VideoPlayerController video4Controller;

  @override
  void initState() {
    super.initState();
    video1Controller = VideoPlayerController.asset("assets/videos/video1.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    video2Controller = VideoPlayerController.asset("assets/videos/video2.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    video3Controller = VideoPlayerController.asset("assets/videos/video1.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    video4Controller = VideoPlayerController.asset("assets/videos/video2.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    start();
  }

  start() async {
    await video1Controller.initialize();
    await video2Controller.initialize();
    await video3Controller.initialize();
    await video4Controller.initialize();
    video1Controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
    video2Controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
    video3Controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
    video4Controller
      ..setLooping(true)
      ..setVolume(0)
      ..play();
  }

  bool isDetailPage = false;
  VideoPlayerController? selectedController;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    return SizedBox(
        width: width * 0.7,
        child: Column(children: [
          SizedBox(height: height * 0.02),
          isDetailPage
              ? Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          isDetailPage = false;
                          start();
                        });
                      },
                      icon: const Icon(Icons.arrow_back_ios)),
                )
              : const SizedBox.shrink(),
          isDetailPage
              ? Column(
                  children: [
                    Container(
                      height: height * 0.25,
                      width: width * 0.20,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: selectedController!.value.isInitialized
                          ? VideoPlayer(selectedController!)
                          : const SizedBox.shrink(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            height: height * 0.25,
                            width: width * 0.20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.asset(
                              selectedController == video1Controller
                                  ? "assets/images/litter1.png"
                                  : "assets/images/litter2.png",
                              height: 100,
                              width: 200,
                              fit: BoxFit.fill,
                            )),
                        const SizedBox(width: 10),
                        Container(
                            height: height * 0.25,
                            width: width * 0.20,
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12)),
                            child: Image.asset(
                              "assets/images/face.jpg",
                              height: 100,
                              width: 200,
                              fit: BoxFit.fill,
                            )),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                        height: height * 0.3,
                        width: width * 0.25,
                        child: Card(
                          color: AppColors.primaryLightColor,
                          child: Table(
                            children: [
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
                                    "Ahemd Ali",
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
                                    "3444223569762",
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
                                    "03439756543",
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
                                    "Lahore",
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
                                    "Johar Town",
                                    textAlign: TextAlign.center,
                                    style: UIHelper.tableCellStyle,
                                  ),
                                )),
                              ]),
                            ],
                          ),
                        ))
                  ],
                )
              : Column(
                  children: [
                    SizedBox(
                        height: height * 0.28,
                        width: width * 0.3,
                        child: Stack(children: [
                          Positioned.fill(
                            child: Image(
                              image: AssetImage(AppImages.monitoringBackground),
                              height: height * 0.28,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ])),
                    SizedBox(height: height * 0.05),
                    SizedBox(
                      height: height * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedController = video1Controller;
                                isDetailPage = true;
                              });
                            },
                            child: Container(
                              width: width * 0.20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: video1Controller.value.isInitialized
                                  ? IgnorePointer(
                                      child: VideoPlayer(video1Controller))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedController = video2Controller;
                                isDetailPage = true;
                              });
                            },
                            child: Container(
                              width: width * 0.20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: video2Controller.value.isInitialized
                                  ? IgnorePointer(
                                      child: VideoPlayer(video2Controller))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 6),
                    SizedBox(
                      height: height * 0.25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedController = video4Controller;
                                isDetailPage = true;
                              });
                            },
                            child: Container(
                              width: width * 0.20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: video4Controller.value.isInitialized
                                  ? IgnorePointer(
                                      child: VideoPlayer(video4Controller))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                          const SizedBox(width: 12),
                          GestureDetector(
                            behavior: HitTestBehavior.deferToChild,
                            onTap: () {
                              log("message");
                              setState(() {
                                selectedController = video3Controller;
                                isDetailPage = true;
                              });
                            },
                            child: Container(
                              width: width * 0.20,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12)),
                              child: video3Controller.value.isInitialized
                                  ? IgnorePointer(
                                      child: VideoPlayer(video3Controller))
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
        ]));
  }
}
