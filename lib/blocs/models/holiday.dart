import 'package:atrak/repository/data/entities/holiday_entity.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

@immutable
class Holiday {
  final String name;
  final DateTime date;

  final DateFormat _format = new DateFormat("d-MMM-yyyy");
  Holiday({this.name, this.date});

  Holiday copyWith(
      {String name,
      DateTime date}) {
    return Holiday(
        name: name ?? this.name,
        date: date ?? this.date);
  }

  @override
  String toString() {
    return 'Holiday{name: $name, date: ${_format.format(date)}}';
  }

  HolidayEntity toEntity() {
    return HolidayEntity(
        name: name,
        date: date);
  }

  static Holiday fromEntity(HolidayEntity entity) {
    return Holiday(
        name: entity.name,
        date: entity.date);
  }
}
