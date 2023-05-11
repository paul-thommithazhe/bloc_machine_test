import 'package:expereal_task/features/cart/bloc/cart_bloc.dart';
import 'package:expereal_task/features/cart/ui/widgets/cartTileWidget.dart';
import 'package:expereal_task/features/home/ui/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartBlocInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.red,
        title: Text("Cart Items"),
      ),
      body: BlocConsumer<CartBloc, CartBlocState>(
        bloc: cartBloc,
        listener: (context, state) {},
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartBlocSuccessState:
              final successState = state as CartBlocSuccessState;
              return successState.cartItems.length == 0
                  ? Center(
                      child: Text(
                        "Cart is Empty",
                        style: TextStyle(fontSize: 22),
                      ),
                    )
                  : ListView.builder(
                      itemCount: successState.cartItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        return CartTileWidget(
                          productDataModel: successState.cartItems[index],
                          cartBloc: cartBloc,
                        );
                      },
                    );
            default:
          }
          return SizedBox();
        },
      ),
    );
  }
}
