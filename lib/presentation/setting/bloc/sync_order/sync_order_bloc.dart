import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
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
      if(data.isEmpty){
        emit(const _Error("Semua data order terupdate"));
      }else{
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
          if(response){
            await ProductLocalDataSource.instance.updateIsSyncOrderById(item.id!);
          }
        }
        emit(const _Success());
      }
    });
  }
}
