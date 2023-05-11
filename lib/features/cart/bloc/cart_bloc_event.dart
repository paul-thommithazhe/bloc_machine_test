part of 'cart_bloc.dart';

@immutable
abstract class CartBlocEvent {}

class CartBlocInitialEvent extends CartBlocEvent {}

class CartBlocRemoveEvent extends CartBlocEvent {
  final ProductDataModel productDataModel;

  CartBlocRemoveEvent({
    required this.productDataModel,
  });
}
