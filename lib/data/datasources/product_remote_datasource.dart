import 'package:dartz/dartz.dart';
import 'package:pos_bengkel/core/constants/variables.dart';
import 'package:pos_bengkel/data/datasources/auth_local_datasource.dart';
import 'package:pos_bengkel/data/models/request/add_product_request_model.dart';
import 'package:pos_bengkel/data/models/response/add_product_response_model.dart';
import 'package:pos_bengkel/data/models/response/products_response_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  Future<Either<String, ProductsResponseModel>> getProducts() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http
        .get(Uri.parse('${Variables.baseUrl}/api/products'), headers: {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json'
    });

    if (response.statusCode == 200) {
      return right(
        ProductsResponseModel.fromJson(
          response.body,
        ),
      );
    } else {
      return left(response.body);
    }
  }

  Future<Either<String, AddProductResponseModel>> addProduct(
      AddProductsRequestModel product) async {
    final authData = await AuthLocalDataSource().getAuthData();
    final Map<String, String> headers = {
      'Authorization': 'Bearer ${authData.token}',
      'Accept': 'application/json'
    };
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${Variables.baseUrl}/api/products'),
    );
    request.headers.addAll(headers);
    request.fields.addAll(product.toMap());
    request.files
        .add(await http.MultipartFile.fromPath("image", product.image.path));

    http.StreamedResponse response = await request.send();

    final String responseBody = await response.stream.bytesToString();
    if (response.statusCode == 201) {
      return right(
        AddProductResponseModel.fromJson(responseBody),
      );
    } else {
      return left(responseBody);
    }
  }
}
