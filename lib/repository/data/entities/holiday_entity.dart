import 'package:intl/intl.dart';

class HolidayEntity {
  final String name;
  final DateTime date;

  static DateFormat format = new DateFormat("d-MMM-yyyy");

  HolidayEntity({this.name, this.date});



  static getDateObject(String date) {
    return format.parse(date);
  }

  static HolidayEntity fromJson(Map<String, Object> json) {
    return HolidayEntity(
      name: json["Name"] as String,
      date: getDateObject(json['Date']),
    );
  }

  Map<String, Object> toJson() {
    return {
      "Name": name,
      "Date": format.format(date),
    };
  }

  @override
  String toString() {
    return 'HolidayEntity{name: $name, Date: ${format.format(date)}}';
  }
}
