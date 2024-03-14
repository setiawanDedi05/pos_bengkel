import 'package:http/http.dart' as http;
import 'package:pos_bengkel/core/constants/variables.dart';
import 'package:pos_bengkel/data/models/request/order_request_model.dart';

import 'auth_local_datasource.dart';

class OrderRemoteDatasource {
  Future<bool> syncOrder(OrderRequestModel request) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final url = Uri.parse('${Variables.baseUrl}/api/orders');
    final response = await http.post(
      url,
      body: request.toJson(),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }
}
