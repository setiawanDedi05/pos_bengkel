import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../data/datasources/product_local_datasource.dart';
import '../../../order/models/order_model.dart';

part 'history_state.dart';
part 'history_event.dart';
part 'history_bloc.freezed.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  List<OrderModel> orders = [];
  HistoryBloc() : super(const _Initial()) {
    on<_Fetch>((event, emit) async {
      emit(const _Loading());
      final data = await ProductLocalDataSource.instance.getAllOrders();
      for (var item in data){
        item.items = await ProductLocalDataSource.instance.getOrderItemByOrderId(item.id!);
      }
      orders = [...data];
      emit(_Success(orders));
    });
  }
}
