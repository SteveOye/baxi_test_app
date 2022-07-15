import 'dart:convert';

DataRequest dataRequestFromJson(String str) =>
    DataRequest.fromJson(json.decode(str));

String dataRequestToJson(DataRequest data) => json.encode(data.toJson());

class DataRequest {
  DataRequest({
    required this.agentReference,
    required this.agentId,
    required this.datacode,
    required this.serviceType,
    required this.amount,
    required this.phone,
  });

  String agentReference;
  String agentId;
  var datacode;
  String serviceType;
  int? amount;
  String phone;

  factory DataRequest.fromJson(Map<String, dynamic> json) => DataRequest(
        agentReference: json["agentReference"],
        agentId: json["agentId"],
        datacode: json["datacode"],
        serviceType: json["service_type"],
        amount: json["amount"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "agentReference": agentReference,
        "agentId": agentId,
        "datacode": datacode,
        "service_type": serviceType,
        "amount": amount,
        "phone": phone,
      };
}
