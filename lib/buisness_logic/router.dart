import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/ui/views/auth_view.dart';
import 'package:infi_devtest/ui/views/cart_view.dart';
import 'package:infi_devtest/ui/views/home_view.dart';
import 'package:infi_devtest/ui/views/splash_screen_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splashScreen:
      return MaterialPageRoute(
        builder: ((context) => const SplashScreen(key: Key('SplashScreen'))),
      );
    case Routes.homeScreen:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(key: Key('HomeScreenView')),
      );
    case Routes.authScreen:
      return MaterialPageRoute(
        builder: (context) => const AuthScreen(key: Key('AuthScreenView')),
      );
    case Routes.cartScreen:
      return MaterialPageRoute(
        builder: ((context) => const CartScreen(key: Key('CartScreenView'))),
      );
    // case ProductDetailView.route:
    //   return MaterialPageRoute(
    //     builder: ((context) => ProductDetailView(
    //           prodData: settings.arguments as Products,
    //         )),
    //   );
    default:
      return MaterialPageRoute(
        builder: (context) => const HomeScreen(key: Key('HomeScreenView')),
      );
  }
}
