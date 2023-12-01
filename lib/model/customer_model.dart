import 'dart:convert';

Customer customerFromJson(String str) => Customer.fromJson(json.decode(str));

String customerToJson(Customer data) => json.encode(data.toJson());

class Customer {
  int id;
  String name;
  String rfc;
  String web;
  String comment;

  Customer({
    required this.id,
    required this.name,
    required this.rfc,
    required this.web,
    required this.comment,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        name: json["name"],
        rfc: json["rfc"],
        web: json["web"],
        comment: json["comment"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rfc": rfc,
        "web": web,
        "comment": comment,
      };

  Map<String, dynamic> toJsonDB() => {
        "name": name,
        "rfc": rfc,
        "web": web,
        "comment": comment,
      };
}
