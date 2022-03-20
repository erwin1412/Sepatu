//untuk auth provider
import 'package:testing/models/user_model.dart';
import 'package:testing/services/auth_service.dart';
import 'package:flutter/cupertino.dart';

class AuthProvider with ChangeNotifier {
  //menambahkan userModel
  UserModel _user;
  //menambahkan getter dan setter
  // getter = usermodel
  // mengembalikan _user
  UserModel get user => _user;

  // setter = user()
  // set user(UserModel) UserModel = value nya
  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  //menambahkan function untuk melakukan register
  Future<bool> register({
    String name,
    String username,
    String email,
    String password,
  }) async {
    //melakukan try catch untuk test user ny berhasil apa tidak
    try {
      UserModel user = await AuthService().register(
        //menambah parameter
        name: name,
        username: username,
        email: email,
        password: password,
      );

      //kalau berhasil kita akan mengganti _user nya adalah user;
      _user = user;
      //kemudian melakukan return atau bisa diartikan kita berhasil mendaftar
      return true;
    } catch (e) {
      //jika gagal akan menampilkan error nya
      print(e);
      return false;
    }
    //setelah selesai semuanya
    //tambahkan provider di main.dart
  }

  //copy saja dari fungsi register diatas
  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
