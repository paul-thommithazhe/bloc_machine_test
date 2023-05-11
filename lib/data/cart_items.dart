import 'package:expereal_task/features/home/models/home_product_data_models.dart';
import 'package:flutter/foundation.dart';

List <ProductDataModel> cartItems = [];

ValueNotifier countItem = ValueNotifier(cartItems.length);