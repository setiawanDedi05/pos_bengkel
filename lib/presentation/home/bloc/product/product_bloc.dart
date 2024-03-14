import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_bengkel/core/extensions/string_ext.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/data/models/request/add_product_request_model.dart';
import 'package:pos_bengkel/data/models/response/products_response_model.dart';

import '../../../../data/datasources/product_remote_datasource.dart';

part 'product_event.dart';

part 'product_state.dart';

part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> products = [];
  final ProductRemoteDataSource _productRemoteDataSource;

  ProductBloc(this._productRemoteDataSource)
      : super(const ProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(const ProductState.loading());
      final response = await _productRemoteDataSource.getProducts();
      response.fold((l) => emit(ProductState.error(l)), (r) {
        ProductLocalDataSource.instance.removeAllDataProduct();
        ProductLocalDataSource.instance.insertAllProduct(r.data);
        products = r.data;
        emit(ProductState.success(r.data));
      });
    });

    on<_FetchByName>((event, emit) async {
      emit(const ProductState.loading());
      final newProducts = products
          .where((element) =>
              element.name.toLowerCase().contains(event.name.toLowerCase()))
          .toList();

      emit(ProductState.success(newProducts));
    });

    on<_FetchLocal>((event, emit) async {
      emit(const ProductState.loading());
      final localProducts =
          await ProductLocalDataSource.instance.getAllProduct();
      products = localProducts;
      emit(ProductState.success(products));
    });

    on<_AddProductLocal>((event, emit) async {
      emit(const ProductState.loading());
      final newProduct =
          await ProductLocalDataSource.instance.insertProduct(event.product);
      if (newProduct != null) {
        products.add(newProduct);
        emit(ProductState.successAddProductLocal(products));
      } else {
        emit(const ProductState.error("Nama Produk sudah ada"));
      }
    });

    on<_AddProduct>((event, emit) async {
      emit(const ProductState.loading());
      final requestData = AddProductsRequestModel(
          name: event.product.name,
          price: event.product.price.toIntegerFromText,
          stock: event.product.stock.toIntegerFromText,
          image: event.image,
          isBestSeller: event.product.isBestSeller ? 1 : 0);
      final response = await _productRemoteDataSource.addProduct(requestData);
      response.fold(
        (l) => emit(ProductState.error(l)),
        (r) {
          products.add(r.data);
          emit(ProductState.success(products));
        },
      );
    });
  }
}
