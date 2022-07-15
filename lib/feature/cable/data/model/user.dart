// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
    this.address,
    this.outstandingBalance,
    this.dueDate,
    this.district,
    this.accountNumber,
    this.minimumAmount,
    this.rawOutput,
  });

  String? name;
  dynamic address;
  int? outstandingBalance;
  DateTime? dueDate;
  dynamic district;
  dynamic accountNumber;
  dynamic minimumAmount;
  RawOutput? rawOutput;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        address: json["address"],
        outstandingBalance: json["outstandingBalance"],
        dueDate: DateTime.parse(json["dueDate"]),
        district: json["district"],
        accountNumber: json["accountNumber"],
        minimumAmount: json["minimumAmount"],
        rawOutput: RawOutput.fromJson(json["rawOutput"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "outstandingBalance": outstandingBalance,
        "dueDate": dueDate!.toIso8601String(),
        "district": district,
        "accountNumber": accountNumber,
        "minimumAmount": minimumAmount,
        "rawOutput": rawOutput!.toJson(),
      };
}

class RawOutput {
  RawOutput({
    this.accountStatus,
    this.firstName,
    this.lastName,
    this.customerType,
    this.invoicePeriod,
    this.dueDate,
    this.customerNumber,
  });

  String? accountStatus;
  String? firstName;
  String? lastName;
  String? customerType;
  int? invoicePeriod;
  DateTime? dueDate;
  int? customerNumber;

  factory RawOutput.fromJson(Map<String, dynamic> json) => RawOutput(
        accountStatus: json["accountStatus"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        customerType: json["customerType"],
        invoicePeriod: json["invoicePeriod"],
        dueDate: DateTime.parse(json["dueDate"]),
        customerNumber: json["customerNumber"],
      );

  Map<String, dynamic> toJson() => {
        "accountStatus": accountStatus,
        "firstName": firstName,
        "lastName": lastName,
        "customerType": customerType,
        "invoicePeriod": invoicePeriod,
        "dueDate": dueDate!.toIso8601String(),
        "customerNumber": customerNumber,
      };
}
