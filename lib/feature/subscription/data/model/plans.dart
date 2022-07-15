import 'dart:convert';

List<Plans> plansFromJson(String str) =>
    List<Plans>.from(json.decode(str).map((x) => Plans.fromJson(x)));

String plansToJson(List<Plans> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Plans {
  Plans({
    this.name,
    this.allowance,
    this.price,
    this.validity,
    this.datacode,
  });

  String? name;
  String? allowance;
  int? price;
  String? validity;
  var datacode;

  factory Plans.fromJson(Map<String, dynamic> json) => Plans(
        name: json["name"],
        allowance: json["allowance"],
        price: json["price"],
        validity: json["validity"],
        datacode: json["datacode"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "allowance": allowance,
        "price": price,
        "validity": validity,
        "datacode": datacode,
      };
}
