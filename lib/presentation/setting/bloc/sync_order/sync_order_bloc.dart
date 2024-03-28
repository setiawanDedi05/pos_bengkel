import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_bengkel/data/datasources/product_local_datasource.dart';
import 'package:pos_bengkel/data/models/request/order_request_model.dart';

import '../../../../data/datasources/order_remote_datasource.dart';

part 'sync_order_event.dart';

part 'sync_order_state.dart';

part 'sync_order_bloc.freezed.dart';

class SyncOrderBloc extends Bloc<SyncOrderEvent, SyncOrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;

  SyncOrderBloc(this.orderRemoteDatasource)
      : super(const SyncOrderState.initial()) {
    on<_SyncOrder>((event, emit) async {
      emit(const _Loading());
      final data = await ProductLocalDataSource.instance.getOrderNotSync();
      if (data.isEmpty) {
        emit(const _Error("Semua data order terupdate"));
      } else {
        bool isResponseTrue = false;
        for (var item in data) {
          item.items = await ProductLocalDataSource.instance
              .getOrderItemByOrderId(item.id!);
          final OrderRequestModel request = OrderRequestModel(
            transactionTime: item.transactionTime,
            idCashier: item.idCashier.toString(),
            totalPrice: item.totalPrice,
            totalQty: item.totalQty,
            paymentMethod: item.paymentMethod.toLowerCase(),
            orderItems: List<OrderItemRequest>.from(
                item.items.map((x) => OrderItemRequest.fromOrderItemModel(x))),
          );
          final response = await orderRemoteDatasource.syncOrder(request);
          if (response) {
            await ProductLocalDataSource.instance
                .updateIsSyncOrderById(item.id!);
            isResponseTrue = true;
          } else {
            isResponseTrue = false;
          }
        }
        isResponseTrue
            ? emit(const _Success())
            : emit(const _Error("Internal Server Error"));
      }
    });

    on<_SyncOrderById>((event, emit) async {
      emit(const _Loading());
      try {
        //cari dulu order berdasarkan id
        final data = await ProductLocalDataSource.instance.getOrderById(event.id);
        /**
         *
          karena data item itu pasti kosong maka isi dulu itemnya dengan data yang ada di order items
         */
        data?.items = await ProductLocalDataSource.instance
            .getOrderItemByOrderId(data.id!);
        // jadiin object buat disync ke server
        final OrderRequestModel request = OrderRequestModel(
          transactionTime: data!.transactionTime,
          idCashier: data.idCashier.toString(),
          totalPrice: data.totalPrice,
          totalQty: data.totalQty,
          paymentMethod: data.paymentMethod.toLowerCase(),
          orderItems: List<OrderItemRequest>.from(
              data.items.map((x) => OrderItemRequest.fromOrderItemModel(x))),
        );
        //dimasukan ke variable response untuk check apakan proses sync berhasil
        final response = await orderRemoteDatasource.syncOrder(request);
        // jika berhasil update local order dengan sync is true
        if (response) {
          await ProductLocalDataSource.instance
              .updateIsSyncOrderById(event.id);
        }
        emit(const _Success());
      } catch (error) {
        debugPrint(error.toString());
        emit(const _Error("Internal Server Error"));
      }
    });
  }
}
