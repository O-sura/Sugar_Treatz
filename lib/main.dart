import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suger_treatz/helper/auth_controller.dart';
import 'package:suger_treatz/screens/address_page.dart';
import 'package:suger_treatz/screens/cart_page.dart';
import 'package:suger_treatz/screens/details_page.dart';
import 'package:suger_treatz/screens/favourites.dart';
import 'package:suger_treatz/screens/mainpage.dart';
import 'package:suger_treatz/screens/notifications.dart';
import 'package:suger_treatz/screens/orders.dart';
import 'package:suger_treatz/screens/settings.dart';
import 'package:suger_treatz/screens/signin_page.dart';
import 'package:suger_treatz/screens/signup_page.dart';
import 'package:suger_treatz/screens/user_profile_page.dart';
import 'package:suger_treatz/utils/dimensions.dart';

import 'screens/profile_page.dart';
import 'screens/search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(AuthController()));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: () => const MainPage()),
        GetPage(name: "/product-detail", page: () => DetailsPage()),
        GetPage(
            name: "/profile",
            page: () => ProfilePage(),
            transition: Transition.leftToRightWithFade),
        GetPage(name: "/search", page: () => const SearchPage()),
        GetPage(name: "/cart", page: () => const ShoppingCart()),
        GetPage(name: "/favourites", page: () => Favourites()),
        GetPage(name: "/signin", page: () => const SignInPage()),
        GetPage(name: "/signup", page: () => const SignUpPage()),
        GetPage(name: "/notifications", page: () => const Notifications()),
        GetPage(name: "/user-profile", page: () => const UserProfile()),
        GetPage(name: "/address", page: () => const Address()),
        GetPage(name: "/order-history", page: () => const OrderHistory()),
        GetPage(name: "/settings", page: () => const Settings()),
      ],
    );
  }
}
