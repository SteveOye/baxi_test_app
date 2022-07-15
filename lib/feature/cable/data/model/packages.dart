import 'dart:convert';

import 'package:baxi_app/feature/cable/data/model/available_option.dart';

List<Package> packageFromJson(String str) =>
    List<Package>.from(json.decode(str).map((x) => Package.fromJson(x)));

String packageToJson(List<Package> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Package {
  Package({
    this.availablePricingOptions,
    this.code,
    this.name,
    this.description,
  });

  List<AvailablePricingOptions>? availablePricingOptions;
  String? code;
  String? name;
  String? description;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        availablePricingOptions: List<AvailablePricingOptions>.from(
            json["availablePricingOptions"]
                .map((x) => AvailablePricingOptions.fromJson(x))),
        code: json["code"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "availablePricingOptions":
            List<dynamic>.from(availablePricingOptions!.map((x) => x.toJson())),
        "code": code,
        "name": name,
        "description": description,
      };
}
