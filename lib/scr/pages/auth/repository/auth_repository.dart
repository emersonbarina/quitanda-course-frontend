import 'package:quitanda/scr/constants/endpoints.dart';
import 'package:quitanda/scr/models/user_model.dart';
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
      print(result['result']);
      final user = UserModel.fromJson(result['result']);
      print(user);

    } else {
      print('SignIn Fail');
      print(result['error']);

    }
  }
}
