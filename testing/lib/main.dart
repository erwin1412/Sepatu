import 'package:testing/pages/Help.dart';
import 'package:testing/pages/cart_page.dart';
import 'package:testing/pages/checkout_page.dart';
import 'package:testing/pages/checkout_success.dart';
import 'package:testing/pages/detail_chat_page.dart';
import 'package:testing/pages/edit_profile.dart';
import 'package:testing/pages/home/main_page.dart';
// import 'package:ecommerce/pages/home/product_page.dart';
import 'package:testing/pages/sign_in_page.dart';
import 'package:testing/pages/sign_up_page.dart';
import 'package:testing/pages/splash_page.dart';
import 'package:testing/pages/your_orders.dart';
import 'package:testing/providers/auth_provider.dart';
import 'package:testing/providers/products_provider.dart';
import 'package:testing/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: backgroundColor1,
    statusBarIconBrightness: Brightness.light,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
          '/sign-in': (context) => SignInPage(),
          '/sign-up': (context) => SignUpPage(),
          '/home': (context) => MainPage(),
          '/detail-chat': (context) => DetailChatPage(),
          '/edit-profile': (context) => EditProfilePage(),
          '/your-orders': (context) => YourOrdersPage(),
          '/help': (context) => HelpPage(),
          //tidak dipake karna sudah ada product model di product page
          // '/product': (context) => ProductPage(),
          '/cart': (context) => CartPage(),
          '/checkout': (context) => CheckoutPage(),
          '/checkout-success': (context) => CheckoutSuccessPage(),
        },
      ),
    );
  }
}
