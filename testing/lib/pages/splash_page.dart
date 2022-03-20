import 'package:testing/providers/products_provider.dart';
import 'package:testing/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ProductProvider>(context, listen: false).getProducts();
    Navigator.pushNamed(context, '/sign-in');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Center(
              child: Container(
                width: 130,
                height: 150,
                decoration: BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/Vector.png')),
                ),
              ),
            ),
          ),
          Container(
            child: Text(
              'Selamat Datang di aplikasi',
              style: TextStyle(color: Colors.red),
            ),
          ),
          Container(
            child: Text(
              'Erwin 19412416',
              style: TextStyle(color: Colors.red, fontWeight: bold),
            ),
          )
        ],
      ),
    );
  }
}
