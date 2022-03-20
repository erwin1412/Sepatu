import 'package:sepatu/providers/auth_provider.dart';
import 'package:sepatu/theme.dart';
import 'package:sepatu/widgets/loading_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController usernameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      //set state untuk ketika dia klik sign up dia akan jadi loading
      setState(() {
        isLoading = true;
      });
      if (await authProvider.register(
        name: nameController.text,
        username: usernameController.text,
        email: emailController.text,
        password: passwordController.text,
      )) {
        // jika pengembalian nya benar maka akan di navigasikan ke halaman home
        Navigator.pushNamed(context, '/sign-in');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: secondaryColor,
            content: Text('Gagal Register', textAlign: TextAlign.center),
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
        margin: EdgeInsets.only(top: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 24,
                fontWeight: semiBold,
              ),
            ),
            Text(
              'Hai, Have a Nice Day',
              style: priceTextStyle,
            ),
          ],
        ),
      );
    }

    Widget emailInput() {
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
              'Email Address',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              //textbox
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_email.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
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

    Widget nameInput() {
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
              'Full Name',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              //textbox
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_name.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: nameController,
                        style: primaryTextStyle,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Full Name',
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

    Widget usernameInput() {
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
              'Username',
              style: subtitleTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              //textbox
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_username.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: primaryTextStyle,
                        controller: usernameController,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Your Username',
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
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: mediaQueryHeight * 0.01,
            ),
            Container(
              height: mediaQueryHeight * 0.05,
              padding: EdgeInsets.symmetric(
                horizontal: 16,
              ),
              //textbox
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 8, 145, 236).withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icon_password.png',
                      width: 17,
                    ),
                    SizedBox(
                      width: 16,
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

    Widget signUpButton() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: mediaQueryWidth * 0.1,
          vertical: mediaQueryHeight * 0.04,
        ),
        width: double.infinity,
        child: TextButton(
            onPressed: handleSignUp,
            // onPressed: () {
            //   Navigator.pushNamed(context, '/sign-in');
            // },
            style: TextButton.styleFrom(
              backgroundColor: Color.fromARGB(255, 8, 145, 236).withOpacity(1),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Text(
              'Sign Up',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            )),
      );
    }

    Widget logo() {
      return Container(
        margin: EdgeInsets.only(top: 30, left: 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Image.asset('assets/Vector.png')],
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
              'Already Have an Account? ',
              style: blackTextStyle.copyWith(
                fontSize: 12,
                fontWeight: medium,
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/sign-in');
              },
              child: Text(
                'Sign In',
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              logo(),
              nameInput(),
              usernameInput(),
              emailInput(),
              passwordInput(),
              isLoading ? LoadingButton() : signUpButton(),
              Spacer(),
              footer()
            ],
          ),
        ),
      ),
    );
  }
}
