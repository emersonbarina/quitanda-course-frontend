import 'package:dio/dio.dart';
import 'package:quitanda/scr/constants/load_env.dart';

abstract class HttpMethod {
  static const String post = 'POST';
  static const String get = 'GET';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  Future<Map> restRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    // Headers of request
    final defaultHeaders = headers?.cast<String, String>() ?? {}
      ..addAll({
        'content-type': 'application/json',
        'accept': 'application/json',
        'X-Parse-Application-Id': LoadEnv.appId,
        'X-Parse-REST-API-Key': LoadEnv.apiKey,
      });

    Dio dio = Dio();

    try{
      Response response = await dio.request(
        url,
        options: Options(
          headers: defaultHeaders,
          method: method,
        ),
        data: body,
      );
      // return result the of server (backend)
      return response.data;

    } on DioError catch(error){
      //  case dio request return is null, return map empty.
      return error.response?.data ?? {};

    } catch (error){
      // if unexpected error occurred, will return a empty map
      return {};

    }
  }
}
