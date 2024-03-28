import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';

import '../../core/constants/variables.dart';
import '../models/response/auth_response_model.dart';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    try{
      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/api/login'),
        body: {
          'email': email,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        return right(AuthResponseModel.fromJson(response.body));
      } else {
        return left(response.body);
      }
    }catch(_){
      return left("Terjadi Kesalah, dalam Internal Server, Silahkan Coba lagi nanti");
    }
  }

  Future<Either<String, String>> logout() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/logout'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      return right(response.body);
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, String>> updateFCMToken(String fcmToken) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/update-fcm'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
        'Accept': 'application/json',
      },
      body: { 'fcm_id': fcmToken }
    );

    if(response.statusCode == 20){
      return Right(response.body);
    }else{
      return Left(response.body);
    }
  }
}
