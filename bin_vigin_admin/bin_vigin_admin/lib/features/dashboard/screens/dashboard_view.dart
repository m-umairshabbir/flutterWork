import 'dart:developer';

import 'package:bin_vigin_admin/features/dashboard/controllers/dashboard_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/controllers/littering_controller.dart';
import 'package:bin_vigin_admin/features/dashboard/models/littering_model.dart';
import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:bin_vigin_admin/utils/app_images.dart';
import 'package:bin_vigin_admin/utils/ui_helper.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final height = size.height;
    final width = size.width;
    return SizedBox(
      height: height,
      width: width * 0.7,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
            const Text("Dashboard",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                // Get.find<DashboardController>()
                //     .navigateTo(const RealTimeMonitoringView(
                //   showBackButton: true,
                // ));
                Get.find<DashboardController>()
                    .sidebarXController
                    .selectIndex(1);
              },
              child: SizedBox(
                height: height * 0.3,
                width: width * 0.4,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image(
                        image: AssetImage(AppImages.monitoringBackground),
                        height: height * 0.3,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: height * 0.25,
              width: width * 0.7,
              child: Obx(() {
                final data = LitteringController.to.litteringList;
                final complaintsCount =
                    data.where((p0) => p0.status == -1).length;
                final finesCount = data
                    .where(
                        (element) => element.status == 0 || element.status == 1)
                    .length;
                final appealsCount =
                    data.where((element) => element.status == 2).length;

                return Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: height * 0.24,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image(
                                image: AssetImage(AppImages.finesBackground),
                                height: height * 0.24,
                              ),
                            ),
                            Positioned(
                                top: height * 0.11,
                                left: width * 0.02,
                                child: Text(
                                  finesCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                              top: height * 0.17,
                              left: width * 0.02,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.find<DashboardController>()
                                    //     .navigateTo(const FinesView(
                                    //   showBackButton: true,
                                    // ));
                                    Get.find<DashboardController>()
                                        .sidebarXController
                                        .selectIndex(3);
                                  },
                                  child: const Text(
                                    "View entire list",
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.24,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image(
                                image:
                                    AssetImage(AppImages.complaintsBackground),
                                height: height * 0.3,
                              ),
                            ),
                            Positioned(
                                top: height * 0.11,
                                left: width * 0.02,
                                child: Text(
                                  complaintsCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                              top: height * 0.17,
                              left: width * 0.02,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.find<DashboardController>()
                                    //     .navigateTo(const ComplaintsView(
                                    //   showBackButton: true,
                                    // ));
                                    Get.find<DashboardController>()
                                        .sidebarXController
                                        .selectIndex(2);
                                  },
                                  child: const Text(
                                    "View entire list",
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.24,
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: Image(
                                image: AssetImage(AppImages.appealsBackground),
                                height: height * 0.3,
                              ),
                            ),
                            Positioned(
                                top: height * 0.11,
                                left: width * 0.02,
                                child: Text(
                                  appealsCount.toString(),
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold),
                                )),
                            Positioned(
                              top: height * 0.17,
                              left: width * 0.02,
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    // Get.find<DashboardController>()
                                    //     .navigateTo(const AppealsView(
                                    //   showBackButton: true,
                                    // ));
                                    Get.find<DashboardController>()
                                        .sidebarXController
                                        .selectIndex(4);
                                  },
                                  child: const Text(
                                    "View entire list",
                                    style: TextStyle(
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
            const SizedBox(height: 16),
            Obx(() {
              final data = LitteringController.to.litteringList
                  .where((p0) => p0.status == 0 || p0.status == 1)
                  .toList();
              if (data.isEmpty) {
                return const SizedBox.shrink();
              }
              return SizedBox(
                height: height * 0.32,
                child: Row(
                  children: [
                    Container(
                      height: height * 0.31,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                          color: AppColors.primaryLightColor,
                          borderRadius: BorderRadius.circular(16)),
                      padding: const EdgeInsets.all(8),
                      child: Stack(
                        children: [
                          SizedBox(
                              width: width * 0.20,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FineLineChart(
                                  data: data,
                                  key: const Key("1"),
                                ),
                              )),
                          Positioned(
                              right: -10,
                              top: 0,
                              bottom: 0,
                              child: Image.asset(
                                AppImages.fineBackground,
                                height: 0.25,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SizedBox(
                        height: height * 0.32,
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          color: AppColors.primaryLightColor,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.only(left: 30),
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "Fine Details",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )),
                                  ),
                                  const SizedBox(height: 12),
                                  ComplaintsList(data: data),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}

class ComplaintsList extends StatelessWidget {
  const ComplaintsList({
    super.key,
    required this.data,
  });
  final List<LitteringModel> data;
  @override
  Widget build(BuildContext context) {
    return data.isEmpty
        ? Center(
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.sizeOf(context).height * 0.26,
              ),
              child: const Text(
                "No fine yet!",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          )
        : Table(children: [
            TableRow(children: [
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Fine Id",
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
                child: Text("Amount",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
              TableCell(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Status",
                    textAlign: TextAlign.center,
                    style: UIHelper.tableHeaderStyle),
              )),
            ]),
            ...data.map((e) => TableRow(
                  children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("${data.indexOf(e) + 1}",
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.date,
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.city,
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.location,
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.fineAmount.toString(),
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(e.status == 0 ? "Un-paid" : "Paid",
                          textAlign: TextAlign.center,
                          style: UIHelper.tableCellStyle.copyWith(
                              color:
                                  e.status == 0 ? Colors.red : Colors.green)),
                    )),
                  ],
                ))
          ]);
  }
}

class FineLineChart extends StatefulWidget {
  final List<LitteringModel> data;

  const FineLineChart({super.key, required this.data});

  @override
  _FineLineChartState createState() => _FineLineChartState();
}

class _FineLineChartState extends State<FineLineChart> {
  late List<LitteringModel> filteredData;
  late double maxFineAmount;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() {
    // Filter data to include only the last 6 days
    final now = DateTime.now();
    final sixDaysAgo = now.subtract(const Duration(days: 6));
    filteredData =
        widget.data.where((e) => e.parsedDate.isAfter(sixDaysAgo)).toList();

    // Sort the filtered data by date
    filteredData.sort((a, b) => a.parsedDate.compareTo(b.parsedDate));

    // Determine the max fine amount for scaling the y-axis
    maxFineAmount = filteredData.isEmpty
        ? 0
        : (filteredData
            .map((e) => e.fineAmount)
            .reduce((a, b) => a > b ? a : b)).toDouble();
    spots = filteredData.asMap().entries.map((entry) {
      final index = entry.key;
      final model = entry.value;
      return FlSpot(index.toDouble(), model.fineAmount.toDouble() / 1000);
    }).toList();
    amounts = divideMaxAmount(maxFineAmount.toInt());
    log(spots.length.toString());
  }

  List<FlSpot> spots = [];
  List<int> amounts = [];
  @override
  Widget build(BuildContext context) {
    return spots.isEmpty ? const SizedBox.shrink() : LineChart(mainData());
  }

  LineChartData mainData() {
    // Create spots for the graph
    log("hereeeeeeeeee");
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        drawHorizontalLine: false,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          axisNameWidget: const Text(
            "Fines",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: bottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (value, meta) =>
                leftTitleWidgets(value, meta, maxFineAmount),
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: filteredData.length.toDouble(),
      minY: 0,
      maxY: 5,
      lineBarsData: [
        LineChartBarData(
          spots: spots,
          isCurved: true,
          gradient: const LinearGradient(
            colors: [Color(0xFF845ED7), Color(0xFF6B8AEB)],
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
        ),
      ],
    );
  }

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black54);
    String text = value % 2 == 0 ? (value / 2).toString() : "";

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 5,
      child: Text(text, style: style),
    );
  }

  Widget leftTitleWidgets(double value, TitleMeta meta, double maxFineAmount) {
    // log("value");
    const style = TextStyle(
        fontWeight: FontWeight.bold, fontSize: 11, color: Colors.black54);
    // final steps = maxFineAmount > 0 ? (maxFineAmount / 5).ceil() : 1;

    // if (value % steps == 0 && value / steps <= 5) {
    final int fineAmount = amounts[value.toInt()];
    final kValue = fineAmount / 1000;
    return Text('RS ${kValue.toStringAsFixed(1)}K',
        style: style, textAlign: TextAlign.left);
    // } else {
    //   return Container();
    // }
  }

  List<int> divideMaxAmount(int totalAmount) {
    int decrement = totalAmount ~/ 5;

    List<int> divisions = [];

    for (int i = 0; i <= 5; i++) {
      divisions.add(totalAmount - decrement * i);
    }
    divisions = divisions.reversed.toList();
    return divisions;
  }
}
