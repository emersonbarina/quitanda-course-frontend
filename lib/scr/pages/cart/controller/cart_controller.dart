import 'package:get/get.dart';
import 'package:quitanda/scr/models/cart_item_model.dart';
import 'package:quitanda/scr/models/item_model.dart';
import 'package:quitanda/scr/pages/auth/controller/auth_controller.dart';
import 'package:quitanda/scr/pages/cart/cart_result/cart_result.dart';
import 'package:quitanda/scr/services/utils_services.dart';

import '../../../constants/texts.dart';
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

  double cartTotalPrice() {
    double total = 0;
    for (final item in cartItems) {
      total += item.totalPrice();
    }
    return total;
  }

  Future<bool> changeItemQuantity({
    required CartItemModel item,
    required int quantity,
  }) async {
    final result = await cartRepository.changeItemQuantity(
      cartItemId: item.id,
      quantity: quantity,
      token: authController.user.token!,
    );
    return result;
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
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  int getItemIndex(ItemModel item) {
    return cartItems.indexWhere((itemInList) => itemInList.item.id == item.id);
  }

  Future<void> addItemToCart({
    required ItemModel item,
    int quantity = 1,
  }) async {
    int itemIndex = getItemIndex(item);

    if (itemIndex >= 0) {
      final product = cartItems[itemIndex];
      final result =
          await changeItemQuantity(item: product, quantity: (product.quantity + quantity));
      if (result) {
        cartItems[itemIndex].quantity += quantity;
      } else {
        utilServices.showToast(
          message: tErrorChangeQuantity,
          isError: true,
        );
      }
    } else {
      final CartResult<String> result = await cartRepository.addItemToCart(
        userId: authController.user.id!,
        token: authController.user.token!,
        productId: item.id,
        quantity: quantity,
      );

      result.when(
        success: (cartItemId) {
          cartItems.add(
            CartItemModel(
              id: cartItemId,
              item: item,
              quantity: quantity,
            ),
          );
        },
        error: (message) {
          utilServices.showToast(
            message: message,
            isError: true,
          );
        },
      );
    }
    update();
  }
}
