import 'dart:convert';

Airtime airtimeFromJson(String str) => Airtime.fromJson(json.decode(str));

String airtimeToJson(Airtime data) => json.encode(data.toJson());

class Airtime {
  Airtime({
    required this.agentReference,
    required this.agentId,
    required this.plan,
    required this.serviceType,
    required this.amount,
    required this.phone,
  });

  String agentReference;
  int agentId;
  String plan;
  String serviceType;
  int amount;
  String phone;

  factory Airtime.fromJson(Map<String, dynamic> json) => Airtime(
        agentReference: json["agentReference"],
        agentId: json["agentId"],
        plan: json["plan"],
        serviceType: json["service_type"],
        amount: json["amount"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "agentReference": agentReference,
        "agentId": agentId,
        "plan": plan,
        "service_type": serviceType,
        "amount": amount,
        "phone": phone,
      };
}
