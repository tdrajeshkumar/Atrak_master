import 'package:atrak/repository/data/entities/user_entity.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

@immutable
class User {
  final String id;
  final String name;
  final DateTime lastCheckIn;
  final DateTime lastCheckOut;

  DateFormat _dateFormat = DateFormat("EEEE d, MMM y, hh:mm");

  User({this.id, this.name, this.lastCheckIn, this.lastCheckOut});

  User copyWith(
      {String id,
      String name,
      DateTime lastCheckedIn,
      DateTime lastCheckedOut}) {
    return User(
        id: id ?? this.id,
        name: name ?? this.name,
        lastCheckIn: lastCheckedIn ?? this.lastCheckIn,
        lastCheckOut: lastCheckedOut ?? this.lastCheckOut);
  }

  @override
  String toString() {
    return 'User{id: $id, name: $name, lastCheckedIn: ${lastCheckIn != null ? _dateFormat.format(lastCheckIn) : 0}, lastCheckedOut: ${lastCheckOut != null ? _dateFormat.format(lastCheckOut) : 0}}';
  }

  UserEntity toEntity() {
    return UserEntity(
        id: id,
        name: name,
        lastCheckIn: lastCheckIn,
        lastCheckOut: lastCheckOut);
  }

  static User fromEntity(UserEntity entity) {
    return User(
        id: entity.id,
        name: entity.name,
        lastCheckIn: entity.lastCheckIn,
        lastCheckOut: entity.lastCheckOut);
  }
}
