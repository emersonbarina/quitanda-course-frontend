import 'package:get/get.dart';
import 'package:quitanda/scr/models/user_model.dart';
import 'package:quitanda/scr/page_route/app_pages.dart';
import 'package:quitanda/scr/pages/auth/repository/auth_repository.dart';
import 'package:quitanda/scr/pages/auth/result/auth_result.dart';
import 'package:quitanda/scr/services/utils_services.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authRepository = AuthRepository();
  final utilsServices = UtilsServices();

  UserModel user = UserModel();

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authRepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(
      success: (user) {
        this.user = user;
        Get.offAllNamed(PageRoutes.baseRoute);
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }
}
