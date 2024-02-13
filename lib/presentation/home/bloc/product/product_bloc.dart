import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/data/models/response/products_response_model.dart';

import '../../../../data/datasources/product_remote_datasource.dart';

part 'product_event.dart';
part 'product_state.dart';
part 'product_bloc.freezed.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  List<Product> products = [];
  final ProductRemoteDataSource _productRemoteDataSource;
  ProductBloc(this._productRemoteDataSource) : super(const ProductState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(const ProductState.loading());
      final response = await _productRemoteDataSource.getProducts();
      response.fold(
            (l) => emit(ProductState.error(l)),
            (r) {
              products = r.data;
              emit(ProductState.success(r.data));
            }
      );
    });

    on<_FetchByName>((event, emit) async {
      emit(const ProductState.loading());
      final newProducts = products.where((element) => element.name.toLowerCase().contains(event.name.toLowerCase())).toList();

      emit(ProductState.success(newProducts));
    });

    on<_FetchLocal>((event, emit) async {
      emit(const ProductState.loading());
      final localProducts = await ProductLocalDataSource.instance.getAllProduct();
      products = localProducts;
      emit(ProductState.success(products));
    });
  }
}
