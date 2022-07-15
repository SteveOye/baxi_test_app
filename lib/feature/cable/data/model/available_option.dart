import 'dart:convert';

List<AvailablePricingOptions> availablePricingOptionsFromJson(String str) =>
    List<AvailablePricingOptions>.from(
        json.decode(str).map((x) => AvailablePricingOptions.fromJson(x)));

String availablePricingOptionsToJson(List<AvailablePricingOptions> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AvailablePricingOptions {
  AvailablePricingOptions({
    required this.monthsPaidFor,
    required this.price,
    required this.invoicePeriod,
  });

  int monthsPaidFor;
  int price;
  int invoicePeriod;

  factory AvailablePricingOptions.fromJson(Map<String, dynamic> json) =>
      AvailablePricingOptions(
        monthsPaidFor: json["monthsPaidFor"],
        price: json["price"],
        invoicePeriod: json["invoicePeriod"],
      );

  Map<String, dynamic> toJson() => {
        "monthsPaidFor": monthsPaidFor,
        "price": price,
        "invoicePeriod": invoicePeriod,
      };
}
