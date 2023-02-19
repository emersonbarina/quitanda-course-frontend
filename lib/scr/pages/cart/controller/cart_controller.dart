import 'package:get/get.dart';
import 'package:quitanda/scr/models/cart_item_model.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/scr/pages/cart/cart_result/cart_result.dart';
import 'package:quitanda/scr/services/utils_services.dart';

import '../repository/cart_repository.dart';

class CartController extends GetxController {
  final cartRepository = CartRepository();
  final authController = Get.find<AuthController>();
  final utilServices = UtilsServices();

  List<CartItemModel> cartItems = [];

  @override
  void onInit() {
    super.onInit();
    getCartItems();
  }

  Future<void> getCartItems() async {
    final CartResult<List<CartItemModel>> result =
        await cartRepository.getCartItems(
      token: authController.user.token!,
      userId: authController.user.id!,
    );
    result.when(
      success: (data) {
        cartItems = data;
        update();
        print(data);
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }
}
