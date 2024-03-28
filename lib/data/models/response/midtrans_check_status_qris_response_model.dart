import 'dart:convert';

class MidtransCheckStatusQrisResponse {
  final String bank;
  final String eci;
  final DateTime transactionTime;
  final String grossAmount;
  final String currency;
  final String orderId;
  final String paymentType;
  final String signatureKey;
  final String statusCode;
  final String transactionId;
  final String transactionStatus;
  final String fraudStatus;
  final DateTime? settlementTime;
  final String statusMessage;
  final String merchantId;

  MidtransCheckStatusQrisResponse(
      {required this.bank,
      required this.eci,
      required this.transactionTime,
      required this.grossAmount,
      required this.currency,
      required this.orderId,
      required this.paymentType,
      required this.signatureKey,
      required this.statusCode,
      required this.transactionId,
      required this.transactionStatus,
      required this.fraudStatus,
      this.settlementTime,
      required this.statusMessage,
      required this.merchantId});

  factory MidtransCheckStatusQrisResponse.fromJson(String str) =>
      MidtransCheckStatusQrisResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MidtransCheckStatusQrisResponse.fromMap(Map<String, dynamic> json) =>
      MidtransCheckStatusQrisResponse(
        bank: json["bank"] ?? "",
        eci: json["eci"] ?? "",
        transactionTime: DateTime.parse(json["transaction_time"]),
        grossAmount: json["gross_amount"],
        currency: json["currency"],
        orderId: json["order_id"],
        paymentType: json["payment_type"],
        signatureKey: json["signature_key"],
        statusCode: json["status_code"],
        transactionId: json["transaction_id"],
        transactionStatus: json["transaction_status"],
        fraudStatus: json["fraud_status"],
        settlementTime: json["settlement_time"] == null
            ? null
            : DateTime.parse(json["settlement_time"]),
        statusMessage: json["status_message"],
        merchantId: json["merchant_id"],
      );

  Map<String, dynamic> toMap() => {
        "bank": bank,
        "eci": eci,
        "transaction_time": transactionTime.toIso8601String(),
        "gross_amount": grossAmount,
        "currency": currency,
        "order_id": orderId,
        "payment_type": paymentType,
        "signature_key": signatureKey,
        "status_code": statusCode,
        "transaction_id": transactionId,
        "transaction_status": transactionStatus,
        "fraud_status": fraudStatus,
        "settlement_time": settlementTime?.toIso8601String(),
        "status_message": statusMessage,
        "merchant_id": merchantId
      };
}
