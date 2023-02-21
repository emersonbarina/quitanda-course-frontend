import 'package:get/get.dart';
import 'package:quitanda/scr/pages/auth/view/sign_in_screen.dart';
import 'package:quitanda/scr/pages/auth/view/sign_up_screen.dart';
import 'package:quitanda/scr/pages/base/base_screen.dart';
import 'package:quitanda/scr/pages/base/binding/navigation_binding.dart';
import 'package:quitanda/scr/pages/cart/cart_binding/cart_binding.dart';
import 'package:quitanda/scr/pages/home/binding/home_binding.dart';
import 'package:quitanda/scr/pages/product/product_screen.dart';
import 'package:quitanda/scr/pages/splash/splash_screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => ProductScreen(),
      name: PageRoutes.productRoute,
    ),
    GetPage(
      page: () => const SplashScreen(),
      name: PageRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PageRoutes.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PageRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PageRoutes.baseRoute,
      bindings: [
        NavigationBinding(),
        HomeBinding(),
        CartBinding(),
      ],
    ),
  ];
}

abstract class PageRoutes {
  static const String productRoute = '/product';
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
