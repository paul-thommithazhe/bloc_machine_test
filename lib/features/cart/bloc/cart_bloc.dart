import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:expereal_task/data/cart_items.dart';
import 'package:expereal_task/features/home/models/home_product_data_models.dart';
import 'package:meta/meta.dart';

part 'cart_bloc_event.dart';
part 'cart_bloc_state.dart';

class CartBloc extends Bloc<CartBlocEvent, CartBlocState> {
  CartBloc() : super(CartBlocInitial()) {
    on<CartBlocInitialEvent>(cartBlocInitialEvent);
    on<CartBlocRemoveEvent>(cartBlocRemoveEvent);
  }

  FutureOr<void> cartBlocInitialEvent(
      CartBlocInitialEvent event, Emitter<CartBlocState> emit) {
    emit(CartBlocSuccessState(cartItems: cartItems));
  }

  FutureOr<void> cartBlocRemoveEvent(
      CartBlocRemoveEvent event, Emitter<CartBlocState> emit) {
    cartItems.remove(event.productDataModel);

    emit(CartBlocSuccessState(cartItems: cartItems));
  }
}
