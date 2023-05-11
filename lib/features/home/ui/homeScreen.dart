import 'package:expereal_task/data/cart_items.dart';
import 'package:expereal_task/features/cart/ui/cartScreen.dart';
import 'package:expereal_task/features/home/bloc/home_bloc.dart';
import 'package:expereal_task/features/home/ui/widgets/product_tile_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeBloc, HomeBlocState>(
        bloc: homeBloc,
        listenWhen: (previous, current) => current is HomeActionState,
        buildWhen: (previous, current) => current is! HomeActionState,
        listener: (context, state) {
          if (state is HomeNavigateToCartScreenActionState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CartScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
         
          switch (state.runtimeType) {
            case HomeLoadingState:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            
            
            
            case HomeLoadedSuccessState:
              final successState = state as HomeLoadedSuccessState;
              return Scaffold(
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.red,
                  title: Text(
                    "Shopify",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  actions: [
                         IconButton(
                          onPressed: () {
                            homeBloc.add(
                              HomeCartButtonNavigateEvent(),
                            );
                          },
                          icon: Icon(Icons.shopping_bag_outlined),
                        )
                    // Stack(
                    //   children: [
                    //     CircleAvatar(
                    //       radius: 12,
                    //       child: ValueListenableBuilder(
                    //         valueListenable: countItem,
                    //         builder: (context,value,_) {
                    //           return Text(countItem.value.toString());
                    //         }
                    //       ),
                    //     ),
                    //     IconButton(
                    //       onPressed: () {
                    //         homeBloc.add(
                    //           HomeCartButtonNavigateEvent(),
                    //         );
                    //       },
                    //       icon: Icon(Icons.shopping_bag_outlined),
                    //     )
                    //   ],
                    // )
                  ],
                ),
                body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProudctTileWidget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  },
                ),
              );

            case HomeErrorState:
              return Scaffold(
                body: Center(
                  child: Text("Error"),
                ),
              );
            default:
              return SizedBox();
          }
        },
      ),
    );
  }
}
