import 'package:sepatu/theme.dart';
import 'package:flutter/material.dart';

class CheckoutSuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        centerTitle: true,
        title: Text('Checkout Success'),
        elevation: 0,
      );
    }

    Widget content() {
      return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/icon_empty_cart.png'),
              SizedBox(height: 20),
              Text(
                // 'You Made a Transaction',
                'Ya Sudah',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
              SizedBox(height: 12),
              Text(
                // 'Stay at home while we \nprepare your dream shoes',
                'Serah kau lah',
                style: secondaryTextStyle.copyWith(
                  fontWeight: bold,
                ),
                textAlign: TextAlign.center,
              ),
              Container(
                width: 196,
                height: 44,
                margin: EdgeInsets.only(top: defaultMargin),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, '/home', (route) => false);
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: tfcolor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  child: Text(
                    'Order Other Shoes',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ),
              Container(
                width: 196,
                height: 44,
                margin: EdgeInsets.only(top: 12),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
                  },
                  style: TextButton.styleFrom(
                      backgroundColor: subtitleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      )),
                  child: Text(
                    'View My Order',
                    style: primaryTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                        color: Color(0xffB7B6BF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      appBar: header(),
      body: content(),
    );
  }
}
