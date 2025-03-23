import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Addincome extends StatefulWidget {
  const Addincome({super.key});

  @override
  State<Addincome> createState() => _AddincomeState();
}

class _AddincomeState extends State<Addincome> {
  DateTime today = DateTime.now();
  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Analytics',
          style: TextStyle(
            fontSize: 26,
            color: Colors.green[400],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text("Selected Day = " + today.toString().split(" ")[0]),
            Container(
              child: TableCalendar(
                locale: "en_US",
                rowHeight: 43,
                headerStyle: HeaderStyle(
                    formatButtonVisible: false, titleCentered: true),
                availableGestures: AvailableGestures.all,
                selectedDayPredicate: (day) => isSameDay(day, today),
                focusedDay: today,
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                onDaySelected: _onDaySelected,
              ),
            ),
          ],
        ),
      ),
      // Container(
      //   child: Center(
      //     child: AspectRatio(
      //       aspectRatio: 1.0,
      //       child: Container(
      //         margin: const EdgeInsets.all(20.0),
      //         child: PieChart(
      //           PieChartData(
      //             sections: [
      //               PieChartSectionData(
      //                   value: 10,
      //                   color: Colors.red,
      //                   radius: 40,
      //                   showTitle: true,
      //                   titleStyle: textStyle,
      //                   title: 'A'),
      //               PieChartSectionData(
      //                   value: 20,
      //                   color: Colors.amber,
      //                   radius: 50,
      //                   titleStyle: textStyle,
      //                   title: 'B'),
      //               PieChartSectionData(
      //                   value: 30,
      //                   color: Colors.purple,
      //                   radius: 60,
      //                   titleStyle: textStyle,
      //                   title: 'C'),
      //               PieChartSectionData(
      //                   value: 40,
      //                   color: Colors.green,
      //                   radius: 70,
      //                   titleStyle: textStyle,
      //                   title: 'D'),
      //               PieChartSectionData(
      //                 value: 50,
      //                 color: Colors.lightBlue,
      //                 radius: 80,
      //                 titleStyle: textStyle.copyWith(color: Colors.black),
      //                 title: 'E',
      //                 borderSide:
      //                     const BorderSide(width: 4, color: Colors.black),
      //                 titlePositionPercentageOffset: 0.5,
      //               ),
      //             ],
      //             centerSpaceRadius: 120,
      //             centerSpaceColor: Colors.black12,
      //             startDegreeOffset: 45,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
