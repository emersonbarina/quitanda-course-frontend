import 'package:flutter_dotenv/flutter_dotenv.dart';

// load environment variables
class LoadEnv {
  static String appId = dotenv.get('ENV_APP_ID');
  static String apiKey = dotenv.get('ENV_REST_API_KEY');
  static String baseUrl = dotenv.get('ENV_BASEURL');
}