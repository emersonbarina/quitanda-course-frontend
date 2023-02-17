import 'package:get/get.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';

import '../repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();

  @override
  void onInit(){
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
  }
}
