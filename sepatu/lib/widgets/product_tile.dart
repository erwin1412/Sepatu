import 'package:sepatu/models/product_model.dart';
import 'package:sepatu/pages/home/product_page.dart';
import 'package:sepatu/theme.dart';
import "package:flutter/material.dart";

class ProductTile extends StatelessWidget {
  final ProductModel product;
  ProductTile(this.product);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //tidak dipake agar biar dinamis
        // Navigator.pushNamed(context, '/product');

        Navigator.push(
          context,
          MaterialPageRoute(
            //productpage(product) = mengembalikan product page yg ada product nya
            builder: (context) => ProductPage(product),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          left: defaultMargin,
          right: defaultMargin,
          bottom: defaultMargin,
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/sepatu1.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Walking',
                    style: blackTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: light,
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text('Sepatu Kets Putih ',
                      style: blackTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: semiBold,
                      )),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    '\$153',
                    style: tfcolor1TextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
