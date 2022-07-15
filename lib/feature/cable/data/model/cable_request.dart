import 'dart:convert';

CableRequest cableRequestFromJson(String str) =>
    CableRequest.fromJson(json.decode(str));

String cableRequestToJson(CableRequest data) => json.encode(data.toJson());

class CableRequest {
  CableRequest({
    required this.totalAmount,
    required this.productMonthsPaidFor,
    required this.productCode,
    required this.serviceType,
    required this.agentId,
    required this.agentReference,
    required this.smartcardNumber,
  });

  String totalAmount;
  String productMonthsPaidFor;
  String productCode;
  String serviceType;
  String agentId;
  String agentReference;
  String smartcardNumber;

  factory CableRequest.fromJson(Map<String, dynamic> json) => CableRequest(
        totalAmount: json["total_amount"],
        productMonthsPaidFor: json["product_monthsPaidFor"],
        productCode: json["product_code"],
        serviceType: json["service_type"],
        agentId: json["agentId"],
        agentReference: json["agentReference"],
        smartcardNumber: json["smartcard_number"],
      );

  Map<String, dynamic> toJson() => {
        "total_amount": totalAmount,
        "product_monthsPaidFor": productMonthsPaidFor,
        "product_code": productCode,
        "service_type": serviceType,
        "agentId": agentId,
        "agentReference": agentReference,
        "smartcard_number": smartcardNumber,
      };
}
