//Models -> Services -> Providers
import 'package:testing/models/product_model.dart';
import 'package:testing/services/product_services.dart';
import 'package:flutter/cupertino.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> get products => _products;
  //melakukank set
  set products(List<ProductModel> products) {
    _products = products;
    notifyListeners();
  }

  //membuat function untuk get products
  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }
}
