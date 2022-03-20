//untuk melakukan request kedalam backend , aman
import 'dart:convert';
import 'package:testing/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  String baseUrl = 'https://sistemerwin.com/api';

//function get products
  Future<List<ProductModel>> getProducts() async {
    var url = '$baseUrl/products';
    var headers = {'Content-Type': 'application/json'};

    var response = await http.get(url, headers: headers);

    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data']['data'];

      //buat list lagi dan awal nya kosong maka products = [];
      List<ProductModel> products = [];

      //perulangan untuk mengambil data
      //boleh pakai map / for bebas dalam perulangan nya
      //var item in "DATA" , dia tertuju ke baris 19
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }

      //melukan return
      return products;
    } else {
      throw Exception('Gagal Get Products!');
    }
    //lanjut ke products provider
  }
}
