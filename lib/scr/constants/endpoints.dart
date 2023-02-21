import 'package:quitanda/scr/constants/load_env.dart';

String baseUrl = LoadEnv.baseUrl;

abstract class EndPoints{

  static String signIn = '$baseUrl/login';
  static String signUp = '$baseUrl/signup';
  static String validateToken = '$baseUrl/validate-token';
  static String resetPassword = '$baseUrl/reset-password';
  static String getAllCategories = '$baseUrl/get-list-category';
  static String getAllProducts = '$baseUrl/get-list-product';
  static String getCartItems = '$baseUrl/get-cart-items';
  static String addCartItems = '$baseUrl/add-item-to-cart';
  static String changeItemQuantity = '$baseUrl/modify-quantity-item';

}