import 'package:expereal_task/features/home/bloc/home_bloc.dart';
import 'package:expereal_task/features/home/models/home_product_data_models.dart';
import 'package:flutter/material.dart';

class ProudctTileWidget extends StatelessWidget {
  final ProductDataModel productDataModel;
  final HomeBloc homeBloc;
  ProudctTileWidget({
    super.key,
    required this.productDataModel,
    required this.homeBloc,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(productDataModel.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            productDataModel.name,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(productDataModel.description),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Rs. " + productDataModel.price.toString(),
                style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(
                    HomeProductCartButtonClickedEvent(
                      clickedProduct: productDataModel,
                    ),
                  );
                },
                icon: Icon(Icons.shopping_bag_outlined),
              )
            ],
          )
        ],
      ),
    );
  }
}
