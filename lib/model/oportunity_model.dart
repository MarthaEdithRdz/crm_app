// Model generates for Felipe's Programs
//
// Class Oportunity
// We suggest to use the file: oportunity_model.dart

import 'dart:convert';

Oportunity oportunityFromJson(String str) =>
    Oportunity.fromJson(json.decode(str));

String oportunityToJson(Oportunity data) => json.encode(data.toJson());

class Oportunity {
  int id;
  String description;
  String comments;
  int amount;
  int customerId;

  Oportunity({
    required this.id,
    required this.description,
    required this.comments,
    required this.amount,
    required this.customerId,
  });

  factory Oportunity.fromJson(Map<String, dynamic> json) => Oportunity(
        id: json["id"],
        description: json["description"],
        comments: json["comments"],
        amount: json["amount"],
        customerId: json["customerid"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "comments": comments,
        "amount": amount,
        "customerid": customerId,
      };

  Map<String, dynamic> toJsonDB() => {
        "description": description,
        "comments": comments,
        "amount": amount,
        "customerid": customerId,
      };
}
