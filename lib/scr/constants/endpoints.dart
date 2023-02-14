import 'package:quitanda/scr/constants/load_env.dart';

String baseUrl = LoadEnv.baseUrl;

abstract class EndPoints{

  static String signIn = '$baseUrl/login';
  static String signUp = '$baseUrl/signup';
  static String validateToken = '$baseUrl/validate-token';
  static String resetPassword = '$baseUrl/reset-password';
  static String getAllCategories = '$baseUrl/get-list-category';

}