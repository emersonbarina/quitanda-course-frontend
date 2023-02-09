import 'package:quitanda/scr/constants/endpoints.dart';
import 'package:quitanda/scr/models/user_model.dart';
import 'package:quitanda/scr/pages/auth/repository/auth_errors.dart'
    as auth_errors;
import 'package:quitanda/scr/services/http_manager.dart';

import '../result/auth_result.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: EndPoints.signIn, method: HttpMethod.post, body: {
      "email": email,
      "password": password,
    });

    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }
}
