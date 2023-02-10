import 'package:get/get.dart';
import 'package:quitanda/scr/constants/storage_keys.dart';
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

  @override
  void onInit(){
    super.onInit();
    validateToken();
  }


  Future<void> validateToken() async {
    String? token = await utilsServices.getLocalData(key: StorageKeys.token);
    if (token == null) {
      Get.offAllNamed(PageRoutes.signInRoute);
      return;
    } else {
      AuthResult result = await authRepository.validateToken(token);
      result.when(
        success: (user) {
          this.user = user;
          saveTokenAndProceedToBase();
        },
        error: (message) {
          signOut();
        },
      );
    }
  }

  Future<void> signOut() async {
    // clean user
    user = UserModel();
    // remove token
    await utilsServices.removeLocalData(key: StorageKeys.token);
    // go to login
    Get.offAllNamed(PageRoutes.signInRoute);
  }

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
        saveTokenAndProceedToBase();
      },
      error: (message) {
        utilsServices.showToast(message: message, isError: true);
      },
    );
  }

  void saveTokenAndProceedToBase() {
    // save token
    utilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    // go page base
    Get.offAllNamed(PageRoutes.baseRoute);
  }
}
