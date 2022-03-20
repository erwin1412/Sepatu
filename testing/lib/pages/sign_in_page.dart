import 'package:testing/providers/auth_provider.dart';
import 'package:testing/theme.dart';
import 'package:testing/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatefulWidget {
  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      //set state untuk ketika dia klik sign up dia akan jadi loading
      setState(() {
        isLoading = true;
      });
      if (await authProvider.login(
        email: emailController.text,
        password: passwordController.text,
      )) {
        // jika pengembalian nya benar maka akan di navigasikan ke halaman home
        Navigator.pushNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text('Gagal login', textAlign: TextAlign.center),
          ),
        );
      }
      //ketika sudah selesai regis dia akan kembali jadi false
      setState(() {
        isLoading = false;
      });
    }

    final mediaQueryHeight = MediaQuery.of(context).size.height;
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    Widget header() {
      return Container(
        margin: EdgeInsets.only(top: mediaQueryHeight * 0.08),
        height: mediaQueryHeight * 0.05,
        child: Center(
          child: Column(
            children: [
              Text(
                'Login',
                style: primaryTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: semiBold,
                ),
              )
            ],
          ),
        ),
      );
    }

    Widget emailInput() {
      return Container(
        padding: EdgeInsets.only(
          top: mediaQueryHeight * 0.05,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: mediaQueryWidth * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Email Address',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.03,
              ),
              //textbox
              decoration: BoxDecoration(
                border: Border.all(color: blackColor),
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: mediaQueryWidth * 0.04,
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.04,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: emailController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Email Address',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget passwordInput() {
      return Container(
        padding: EdgeInsets.only(
          top: mediaQueryHeight * 0.02,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: mediaQueryWidth * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Password',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: mediaQueryWidth * 0.03,
              ),
              //textbox
              decoration: BoxDecoration(
                border: Border.all(color: blackColor),
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: mediaQueryWidth * 0.04,
                    ),
                    SizedBox(
                      width: mediaQueryWidth * 0.04,
                    ),
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        style: primaryTextStyle,
                        controller: passwordController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Password',
                          hintStyle: subtitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget signInButton() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: mediaQueryWidth * 0.1,
          vertical: mediaQueryHeight * 0.05,
        ),
        height: 50,
        width: double.infinity,
        child: TextButton(
            onPressed: handleSignIn,
            style: TextButton.styleFrom(
              backgroundColor:
                  Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Sign In',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: bold,
              ),
            )),
      );
    }

    Widget logo() {
      return Container(
        height: mediaQueryHeight * 0.1,
        child: Center(
          child: Image.asset('assets/Vector.png'),
        ),
      );
    }

    Widget footer() {
      return Container(
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Dont Have an Account? ',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-up');
              },
              child: Text(
                'Sign Up',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          // margin: EdgeInsets.symmetric(
          //   horizontal: defaultMargin,
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              logo(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signInButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
