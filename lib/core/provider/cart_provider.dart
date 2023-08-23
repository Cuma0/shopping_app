import 'package:flutter/material.dart';

import '../model/product_model.dart';

class CartProvider extends ChangeNotifier {
  Map<ProductModel, int> items = {};

  void addProduct(ProductModel productModel, int quantity) {
    if (quantity == 0 ||
        (quantity == -1 && items[productModel]! + quantity == 0)) {
      items.remove(productModel);
    } else {
      items[productModel] = (items[productModel] ?? 0) + quantity;
    }
    notifyListeners();
  }
}
