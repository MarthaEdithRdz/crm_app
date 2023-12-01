// Model generates for Felipe's Programs
//
// Class Contact
// We suggest to use the file: contact_model.dart

import 'dart:convert';

Contact contactFromJson(String str) => Contact.fromJson(json.decode(str));

String contactToJson(Contact data) => json.encode(data.toJson());

class Contact {
  int id;
  String name;
  String position;
  String phone;
  String email;
  String comment;
  int birthday;
  int birthmonth;
  int customerId;

  Contact({
    required this.id,
    required this.name,
    required this.position,
    required this.phone,
    required this.email,
    required this.comment,
    required this.birthday,
    required this.birthmonth,
    required this.customerId,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        id: json["id"],
        name: json["name"],
        position: json["position"],
        phone: json["phone"],
        email: json["email"],
        comment: json["comment"],
        birthday: json["birthday"],
        birthmonth: json["birthmonth"],
        customerId: json["customerid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "position": position,
        "phone": phone,
        "email": email,
        "comment": comment,
        "birthday": birthday,
        "birthmonth": birthmonth,
        "customerid": customerId,
      };

  Map<String, dynamic> toJsonDB() => {
        "name": name,
        "position": position,
        "phone": phone,
        "email": email,
        "comment": comment,
        "birthday": birthday,
        "birthmonth": birthmonth,
        "customerid": customerId,
      };
}
