import 'dart:convert';

Balance balanceFromJson(String str) => Balance.fromJson(json.decode(str));

String balanceToJson(Balance data) => json.encode(data.toJson());

class Balance {
  Balance({
    this.balance,
    this.lastDeposit,
  });

  double? balance;
  DateTime? lastDeposit;

  factory Balance.fromJson(Map<String, dynamic> json) => Balance(
        balance: json["balance"].toDouble(),
        lastDeposit: DateTime.parse(json["lastDeposit"]),
      );

  Map<String, dynamic> toJson() => {
        "balance": balance,
        "lastDeposit": lastDeposit!.toIso8601String(),
      };
}
