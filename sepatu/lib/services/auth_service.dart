//untuk melakukan request kedalam backend
import 'dart:convert';

import 'package:sepatu/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String baseUrl = 'https://sistemerwin.com/api';

  //menambahkan sebuah function
  Future<UserModel> register({
    //menambahkan beberapa parameter (variabel)
    String name,
    String username,
    String email,
    String password,
  }) async {
    // url , headers , body sesuaikan sama yg di postman
    var url = '$baseUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });
    //disamping http.post , itu tergantung method di postman
    //karna register adalah POST maka dia pake http.post
    //jika dia get maka , http.get
    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    //test apakah response status saat sukses = 200?
    if (response.statusCode == 200) {
      // karna di postman saat di run response ny bernama data (setelah meta ada data)
      //maka setelah response.body hrs diisi dgn ['data']
      //sesuaikan sama yg di postman
      var data = jsonDecode(response.body)['data'];

      //membuat sebuah usermodel
      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      //jika berhasil return user
      return user;
    } else {
      // jika bukan 200 maka
      throw Exception('Gagal Register');
    }
  }

  //copy paste saja dari Fungsi REGISTER terus ambil data2 yf diperlukan
  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = '$baseUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];

      UserModel user = UserModel.fromJson(data['user']);
      user.token = 'Bearer ' + data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
