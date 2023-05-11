part of 'home_bloc.dart';

@immutable
abstract class HomeBlocState {
  int count = cartItems.length;
}

//for action navigation
abstract class HomeActionState extends HomeBlocState {}

class HomeBlocInitial extends HomeBlocState {}

//for getting the count of the cart items.
class HomeBlocWithCartCountState extends HomeBlocState {
  int count;
  HomeBlocWithCartCountState({required this.count});
}

//home screen before loading the data..some circularloading widget
class HomeLoadingState extends HomeBlocState {}

//successfully loading the data in the home screen
class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductDataModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

//if any error when the home screen loads..
class HomeErrorState extends HomeBlocState {}

//for navigating to cart screen from home
class HomeNavigateToCartScreenActionState extends HomeActionState {}
