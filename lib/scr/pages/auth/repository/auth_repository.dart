import 'package:quitanda/scr/constants/endpoints.dart';
import 'package:quitanda/scr/models/user_model.dart';
import 'package:quitanda/scr/pages/auth/repository/auth_errors.dart'
    as auth_errors;
import 'package:quitanda/scr/services/http_manager.dart';

import '../result/auth_result.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  AuthResult handleUserOrError(Map<dynamic, dynamic> result) {
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }

  Future<AuthResult> validateToken(String token) async {
    final result = await _httpManager.restRequest(
        url: EndPoints.validateToken,
        method: HttpMethod.post,
        headers: {
          'X-Parse-Session-Token': token,
        });
    if (result['result'] != null) {
      final user = UserModel.fromJson(result['result']);
      return AuthResult.success(user);
    } else {
      return AuthResult.error(auth_errors.authErrorsString(result['error']));
    }
  }

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager
        .restRequest(url: EndPoints.signIn, method: HttpMethod.post, body: {
      'email': email,
      'password': password,
    });
    return handleUserOrError(result);
  }

  Future<AuthResult> signUp(UserModel user) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.signUp,
      method: HttpMethod.post,
      body: user.toJson(),
    );
    return handleUserOrError(result);
  }

  Future<void> resetPassword(String email) async {
    await _httpManager.restRequest(
      url: EndPoints.resetPassword,
      method: HttpMethod.post,
      body: {'email': email},
    );
  }
}
