import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../data/datasources/product_local_datasource.dart';
import '../../../order/models/order_model.dart';

part 'draft_order_event.dart';
part 'draft_order_state.dart';
part 'draft_order_bloc.freezed.dart';

class DraftOrderBloc extends Bloc<DraftOrderEvent, DraftOrderState> {
  List<OrderModel> orders = [];
  DraftOrderBloc() : super(const DraftOrderState.initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());
      final data = await ProductLocalDataSource.instance.getOrderNotCheckout();
      for (var item in data){
        item.items = await ProductLocalDataSource.instance.getOrderItemByOrderId(item.id!);
      }
      orders = [...data];
      emit(_Success(orders));
    });
  }
}
