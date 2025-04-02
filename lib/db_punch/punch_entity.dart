import 'package:intl/intl.dart';

class PunchEntity {
  int id;
  DateTime createdTime;
  int type;
  DateTime punchTime;

  PunchEntity({
    required this.id,
    required this.createdTime,
    required this.type,
    required this.punchTime,
  });

  factory PunchEntity.fromJson(Map<String, dynamic> json) {
    return PunchEntity(
      id: json['id'],
      createdTime: DateTime.parse(json['createdTime']),
      type: json['type'],
      punchTime: DateTime.parse(json['punchTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdTime': createdTime.toIso8601String(),
     'type': type,
      'punchTime': punchTime.toIso8601String(),
    };
  }

  String get punchTimeStr => DateFormat('HH:mm').format(punchTime);

  bool get isOut {
    final onDuty = DateTime(
        punchTime.year, punchTime.month, punchTime.day, 9, 0, 0);
    final offDuty = DateTime(
        punchTime.year, punchTime.month, punchTime.day, 18, 0, 0);
    if (type == 0) {
      return punchTime.isAfter(onDuty);
    }
    return punchTime.isBefore(offDuty);
  }

}