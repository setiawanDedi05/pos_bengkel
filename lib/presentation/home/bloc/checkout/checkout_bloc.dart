import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pos_bengkel/data/models/response/products_response_model.dart';
import 'package:pos_bengkel/presentation/home/models/order_item.dart';

part 'checkout_event.dart';

part 'checkout_state.dart';

part 'checkout_bloc.freezed.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  CheckoutBloc() : super(const _Success([], 0, 0)) {
    on<_AddItem>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.items];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        newCheckout[index].quantity++;
      } else {
        newCheckout.add(OrderItem(product: event.product, quantity: 1));
      }

      // int totalQuantity = newCheckout.fold(0, (previousValue, element) => previousValue + element.quantity);
      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * int.parse(element.product.price);
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice));
    });

    on<_ReduceItem>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.items];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout
            .indexWhere((element) => element.product == event.product);
        if (newCheckout[index].quantity > 1) {
          newCheckout[index].quantity--;
        } else {
          newCheckout.removeAt(index);
        }
      }

      // int totalQuantity = newCheckout.fold(0, (previousValue, element) => previousValue + element.quantity);
      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * int.parse(element.product.price);
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice));
    });

    on<_ReduceOrder>((event, emit) {
      var currentState = state as _Success;
      List<OrderItem> newCheckout = [...currentState.items];
      emit(const _Loading());
      if (newCheckout.any((element) => element.product == event.product)) {
        var index = newCheckout.indexWhere((element) => element.product == event.product);
          newCheckout.removeAt(index);
      }

      int totalQuantity = 0;
      int totalPrice = 0;
      for (var element in newCheckout) {
        totalQuantity += element.quantity;
        totalPrice += element.quantity * int.parse(element.product.price);
      }

      emit(_Success(newCheckout, totalQuantity, totalPrice));
    });

    on<_Started>((event, emit) {
      emit(const _Loading());
      emit(const _Success([], 0, 0));
    });
  }
}
