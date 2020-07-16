import 'dart:convert';

import 'package:atrak/blocs/models/holiday.dart';
import 'package:atrak/repository/data/entities/holiday_entity.dart';
import 'package:atrak/theme.dart';
import 'package:atrak/widgets/item_holiday_day.dart';
import 'package:atrak/widgets/item_holiday_month.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HolidayListScreen extends StatefulWidget {
  String holidays =
      '[{"Name": "NewYear", "Date": "1-Jan-2019"}, {"Name": "Republic Day", "Date": "26-Jan-2019"}, {"Name": "May Day", "Date": "1-May-2019"},{"Name": "Independence Day", "Date": "15-Aug-2019"},{"Name": "Christmas", "Date": "25-Dec-2019"}]';

  @override
  _HolidayListScreenState createState() => _HolidayListScreenState();
}

class _HolidayListScreenState extends State<HolidayListScreen> {
  List<Widget> holidayWidgetList = <Widget>[];

  @override
  void initState() {
    super.initState();

    DateFormat monthFormat = new DateFormat("MMMM");
    DateFormat dayFormat = new DateFormat("EEE dd");

    String currentMonth = '';

    var holidays = JsonDecoder().convert(widget.holidays);

    var holidayList = holidays as List;

    holidayList
        .map((json) => Holiday.fromEntity(HolidayEntity.fromJson(json)))
        .map((holiday) {
          print(holiday.toString());
          if(currentMonth != monthFormat.format(holiday.date)){
            currentMonth = monthFormat.format(holiday.date);
            holidayWidgetList.add(ItemHolidayMonth(month: currentMonth,));
          }
          print(holiday.toString());
          holidayWidgetList.add(ItemHolidayDay(name: holiday.name, day: dayFormat.format(holiday.date)));
    }).toList();

    //  print(holidayModelList.first.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Holiday List",
          style: Theme.of(context).textTheme.display1.copyWith(
              fontWeight: FontWeight.w600,
              color: AtrakTheme.greyTextColor,
              fontSize: 20.0),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: AtrakTheme.backArrowColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        color: AtrakTheme.attendanceBackgroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "Holidays 2018",
                style: Theme.of(context).textTheme.display3.copyWith(
                    fontSize: 24.0, color: AtrakTheme.darkDisplayColor),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                    color: Colors.white),
                child: ListView(shrinkWrap: true, children: holidayWidgetList),
              ),
            )
          ],
        ),
      ),
    );
  }
}
