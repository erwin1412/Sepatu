import 'package:testing/theme.dart';
import 'package:testing/widgets/checkout_card.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        title: Text('Checkout Details'),
        elevation: 0,
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          // NOTE:List ITEMS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'List Items',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium,
                ),
              ),
              CheckoutCard(),
              CheckoutCard(),
            ],
          ),
          // NOTE: ADDRESS
          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address Details',
                  style: priceTextStyle,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/icon_store_location.png',
                              width: 40,
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Image.asset(
                          'assets/icon_line.png',
                          height: 30,
                        ),
                        SizedBox(height: 5),
                        Column(
                          children: [
                            Image.asset(
                              'assets/icon_your_address.png',
                              width: 40,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Store Location',
                            style: subtitleTextStyle,
                          ),
                          Text(
                            'Ibox Punya',
                            style: primaryTextStyle,
                          ),
                          SizedBox(height: 30),
                          Text(
                            'Your Address',
                            style: subtitleTextStyle,
                          ),
                          Text(
                            'Pontianak',
                            style: primaryTextStyle,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),

          Container(
            margin: EdgeInsets.only(top: defaultMargin),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: backgroundColor4,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Payment Summary',
                  style: primaryTextStyle.copyWith(fontWeight: semiBold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Quantity',
                      style: subtitleTextStyle,
                    ),
                    Text(
                      '4 items',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Product Price',
                      style: subtitleTextStyle,
                    ),
                    Text(
                      '\$1.332,00',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Shipping',
                      style: subtitleTextStyle,
                    ),
                    Text(
                      'Free',
                      style: primaryTextStyle,
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Divider(
                  thickness: 1,
                  color: subtitleColor,
                ),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total',
                      style: priceTextStyle,
                    ),
                    Text(
                      '\$1.332,00',
                      style: priceTextStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),

          //NOTE:Checkout Button
          SizedBox(height: defaultMargin),
          Divider(
            thickness: 1,
            color: subtitleColor,
          ),
          Container(
            height: 50,
            width: double.infinity,
            margin: EdgeInsets.symmetric(
              vertical: defaultMargin,
            ),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: tfcolor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  )),
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/checkout-success', (route) => false);
              },
              child: Text(
                'Checkout Now',
                style: primaryTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
    );
  }
}
