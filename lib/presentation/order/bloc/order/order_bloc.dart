import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../home/models/order_item.dart';

part 'order_event.dart';

part 'order_state.dart';

part 'order_bloc.freezed.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(const _Success([], 0, 0, '', 0, 0, 'anonymous')) {
    on<_AddPaymentMethod>(
      (event, emit) {
        emit(const _Loading());
        emit(
          _Success(
            event.items,
            event.items.fold(0,
                (previousValue, element) => previousValue + element.quantity),
            event.items.fold(
              0,
              (previousValue, element) =>
                  previousValue +
                  (element.quantity * int.parse(element.product.price)),
            ),
            event.paymentMethod,
            0,
            0,
            'anonymous'
          ),
        );
      },
    );

    on<_AddNominal>(
      (event, emit) {
        var currentState = state as _Success;
        emit(const _Loading());
        emit(
          _Success(
            currentState.items,
            currentState.totalQty,
            currentState.totalPrice,
            currentState.paymentMethod,
            event.nominal,
            currentState.serviceFee,
            currentState.orderName
          ),
        );
      },
    );

    on<_AddServiceFee>(
          (event, emit) {
        var currentState = state as _Success;
        emit(const _Loading());
        emit(
          _Success(
            currentState.items,
            currentState.totalQty,
            currentState.totalPrice,
            currentState.paymentMethod,
            currentState.nominal,
            event.fee,
            currentState.orderName
          ),
        );
      },
    );

    on<_AddOrderName>(
          (event, emit) {
        var currentState = state as _Success;
        emit(const _Loading());
        emit(
          _Success(
              currentState.items,
              currentState.totalQty,
              currentState.totalPrice,
              currentState.paymentMethod,
              currentState.nominal,
              currentState.serviceFee,
              event.name
          ),
        );
      },
    );

    on<_Started>((event, emit){
      emit(const _Loading());
      emit(const _Success([], 0, 0, '', 0, 0, "anonymous"));
    });
  }
}
