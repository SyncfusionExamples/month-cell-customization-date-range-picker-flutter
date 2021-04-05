import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

void main() => runApp(CellCustomization());

class CellCustomization extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MonthCellCustomization(),
    );
  }
}

class MonthCellCustomization extends StatefulWidget {
  @override
  _MonthCellCustomizationState createState() => _MonthCellCustomizationState();
}

class _MonthCellCustomizationState extends State<MonthCellCustomization> {
  late List<DateTime> _blackoutDates;
  late List<DateTime> _specialDates;
  final Color weekEndColor = Color(0xFF0e9aa7),
      specialDatesColor = Color(0xFFf6cd61),
      todayColor = Color(0xFFff6f69),
      leadingTrailingDatesColor = Color(0xFF88d8b0),
      blackoutDatesColor = Colors.black;

  @override
  void initState() {
    _blackoutDates = _getBlackoutDates();
    _specialDates = _getSpecialDates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Card(
      margin: const EdgeInsets.fromLTRB(40, 150, 40, 150),
      child: SfDateRangePicker(
        view: DateRangePickerView.month,
        monthViewSettings: DateRangePickerMonthViewSettings(
            specialDates: _specialDates,
            showTrailingAndLeadingDates: true,
            blackoutDates: _blackoutDates),
        selectionColor: Color(0xFFf8dbdff),
        monthCellStyle: DateRangePickerMonthCellStyle(
            blackoutDateTextStyle: TextStyle(
                color: blackoutDatesColor,
                decoration: TextDecoration.lineThrough),
            specialDatesDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1),
                color: specialDatesColor),
            specialDatesTextStyle: TextStyle(color: Colors.black),
            cellDecoration: BoxDecoration(shape: BoxShape.circle),
            todayTextStyle: TextStyle(color: Colors.white),
            todayCellDecoration:
                BoxDecoration(shape: BoxShape.circle, color: todayColor),
            weekendDatesDecoration: BoxDecoration(
                color: weekEndColor,
                border: Border.all(width: 1),
                shape: BoxShape.circle),
            trailingDatesDecoration: BoxDecoration(
                shape: BoxShape.rectangle, color: leadingTrailingDatesColor),
            leadingDatesDecoration: BoxDecoration(
                shape: BoxShape.rectangle, color: leadingTrailingDatesColor)),
        todayHighlightColor: Colors.orange,
      ),
    ));
  }

  List<DateTime> _getBlackoutDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime blackoutDate = DateTime.now();
    dates.add(blackoutDate.add(Duration(days: 1)));
    dates.add(blackoutDate.add(Duration(days: 2)));
    dates.add(blackoutDate.add(Duration(days: 3)));

    return dates;
  }

  List<DateTime> _getSpecialDates() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime startDate =
        DateTime.now().subtract(const Duration(days: 990));
    final DateTime endDate = DateTime.now().add(const Duration(days: 990));
    final Random random = Random();
    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 25))) {
      for (int i = 0; i < 3; i++) {
        dates.add(date.add(Duration(days: random.nextInt(i + 4))));
      }
    }

    return dates;
  }
}
