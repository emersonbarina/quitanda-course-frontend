import 'package:quitanda/scr/constants/endpoints.dart';
import 'package:quitanda/scr/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signIn,
      method: HttpMethod.post,
      body: {
        "email": email,
        "password": password,
      }
    );

    if(result['result'] != null){
      print('SignIn Ok');

    } else {
      print('SignIn Fail');

    }
  }
}
