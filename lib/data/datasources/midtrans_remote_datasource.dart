import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pos_bengkel/data/models/response/midtrans_qris_response_model.dart';

import '../models/response/midtrans_check_status_qris_response_model.dart';

class MidtransRemoteDatasource {
  String generateBasicAuthHeader(String serverKey) {
    final base64ServerKey = base64Encode(utf8.encode('$serverKey:'));
    return 'Basic $base64ServerKey';
  }

  Future<MidtransQrisResponse> generateQRCode(
      String orderId, int grossAmount) async {
    final headers = {
      'accept': 'application/json',
      'content-type': 'application/json',
      'Authorization':
          generateBasicAuthHeader('SB-Mid-server-fKLK2DfBu_7G0hBn4LLuA1k1')
    };

    final requestBody = jsonEncode({
      "payment_type": "gopay",
      "transaction_details": {"order_id": orderId, "gross_amount": grossAmount}
    });

    final response = await http.post(
        Uri.parse('https://api.sandbox.midtrans.com/v2/charge'),
        headers: headers,
        body: requestBody);

    if (response.statusCode == 200) {
      return MidtransQrisResponse.fromJson(response.body);
    } else {
      throw Exception('Gagal membuat QR Code');
    }
  }

  Future<MidtransCheckStatusQrisResponse> checkStatus(String orderId) async{
    final headers = {
      'accept': 'application/json',
      'content-type': 'application/json',
      'Authorization':
      generateBasicAuthHeader('SB-Mid-server-fKLK2DfBu_7G0hBn4LLuA1k1')
    };
    
    final response = await http.get(Uri.parse('https://api.sandbox.midtrans.com/v2/$orderId/status'), headers: headers);
    if (response.statusCode == 200) {
      return MidtransCheckStatusQrisResponse.fromJson(response.body);
    } else {
      throw Exception('Gagal Mencari Status code dari id $orderId');
    }

  }

}
