import 'package:bin_vigin_admin/features/dashboard/models/littering_model.dart';
import 'package:bin_vigin_admin/utils/app_colors.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _BarChart extends StatelessWidget {
  final List<BarChartGroupData> barGroups;
  final double maxY;

  const _BarChart({required this.barGroups, required this.maxY});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barTouchData: barTouchData,
        titlesData: titlesData,
        borderData: borderData,
        barGroups: barGroups,
        gridData: const FlGridData(show: false),
        alignment: BarChartAlignment.spaceAround,
        maxY: maxY,
      ),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (group) => Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              TextStyle(
                color: AppColors.primaryLightColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 11,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 25,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          axisNameWidget: const Text(
            "Weekly Littering Complaint Records",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
          ),
          sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
              getTitlesWidget: (a, b) => const SizedBox.shrink()),
        ),
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlBorderData get borderData => FlBorderData(
        show: false,
      );
}

class ComplaintBarChart extends StatefulWidget {
  final List<LitteringModel> litteringList;
  const ComplaintBarChart({super.key, required this.litteringList});

  @override
  State<StatefulWidget> createState() => BarChartSample3State();
}

class BarChartSample3State extends State<ComplaintBarChart> {
  Map<String, int> countLitteringByDay(List<LitteringModel> litteringList) {
    Map<String, int> countByDay = {
      'Mon': 0,
      'Tue': 0,
      'Wed': 0,
      'Thu': 0,
      'Fri': 0,
      'Sat': 0,
      'Sun': 0,
    };

    DateTime now = DateTime.now();
    DateTime lastWeek = now.subtract(const Duration(days: 7));

    for (LitteringModel littering in litteringList) {
      DateTime parsedDate = littering.parsedDate;

      if (parsedDate.isAfter(lastWeek) && parsedDate.isBefore(now)) {
        String day = DateFormat('E').format(parsedDate);
        if (countByDay.containsKey(day)) {
          countByDay[day] = countByDay[day]! + 1;
        }
      }
    }

    return countByDay;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> litteringCounts =
        countLitteringByDay(widget.litteringList);
    List<String> daysOfWeek = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    List<Color> barColors = [
      Colors.orange, // Monday
      Colors.pink, // Tuesday
      Colors.green, // Wednesday
      Colors.deepOrange, // Thursday
      Colors.grey, // Friday
      AppColors.primaryDarkColor, // Saturday
      Colors.amberAccent, // Sunday
    ];
    List<BarChartGroupData> barGroups = [];

    int maxCount = 0;
    for (int i = 0; i < daysOfWeek.length; i++) {
      int count = litteringCounts[daysOfWeek[i]] ?? 0;
      if (count > maxCount) {
        maxCount = count;
      }
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              toY: count.toDouble(),
              color: barColors[i],
              width: 16,
            ),
          ],
          showingTooltipIndicators: [0],
        ),
      );
    }

    return Container(
      height: 100,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: _BarChart(barGroups: barGroups, maxY: maxCount.toDouble()),
    );
  }
}
