import 'package:flutter/material.dart';

class CartModel extends StatefulWidget {
  @override
  _CartModelState createState() => _CartModelState();
}

class _CartModelState extends State<CartModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Cart Page")),
    );
  }
}
