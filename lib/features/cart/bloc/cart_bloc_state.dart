part of 'cart_bloc.dart';

@immutable
abstract class CartBlocState {}

abstract class CartActionState extends CartBlocState {}

class CartBlocInitial extends CartBlocState {}

class CartBlocSuccessState extends CartBlocState {
  final List<ProductDataModel> cartItems;

  CartBlocSuccessState({
    required this.cartItems,
  });
}
