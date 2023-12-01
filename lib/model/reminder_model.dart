import 'dart:convert';

Reminder reminderFromJson(String str) => Reminder.fromJson(json.decode(str));

String reminderToJson(Reminder data) => json.encode(data.toJson());

class Reminder {
  int id;
  String name;
  String comment;
  int status;

  Reminder({
    required this.id,
    required this.name,
    required this.comment,
    required this.status,
  });

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
        id: json["id"],
        name: json["name"],
        comment: json["comment"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "comment": comment,
        "status": status,
      };

  Map<String, dynamic> toJsonDB() => {
        "name": name,
        "comment": comment,
        "status": status,
      };
}
