part of 'product_bloc.dart';

@freezed
class ProductEvent with _$ProductEvent {
  const factory ProductEvent.started() = _Started;
  const factory ProductEvent.fetch() = _Fetch;
  const factory ProductEvent.fetchByName(String name) = _FetchByName;
  const factory ProductEvent.fetchLocal() = _FetchLocal;
  const factory ProductEvent.addProductLocal(Product product) = _AddProductLocal;
  const factory ProductEvent.addProduct(Product product, XFile image) = _AddProduct;
}
