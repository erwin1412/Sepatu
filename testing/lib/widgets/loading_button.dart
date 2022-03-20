import 'package:flutter/material.dart';
import 'package:testing/theme.dart';

class LoadingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final mediaQueryHeight = MediaQuery.of(context).size.height;
    return Center(
      child: Container(
        height: 50,
        width: mediaQueryWidth * 0.8,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
            onPressed: () {},
            // onPressed: () {
            //   Navigator.pushNamed(context, '/sign-in');
            // },
            style: TextButton.styleFrom(
              backgroundColor: tfcolor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(
                      primaryTextColor,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Loading',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
