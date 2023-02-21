import 'package:quitanda/scr/constants/texts.dart';
import 'package:quitanda/scr/models/cart_item_model.dart';
import 'package:quitanda/scr/pages/cart/cart_result/cart_result.dart';

import '../../../constants/endpoints.dart';
import '../../../services/http_manager.dart';

class CartRepository {
  final HttpManager _httpManager = HttpManager();

  Future<CartResult<List<CartItemModel>>> getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getCartItems,
      method: HttpMethod.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );
    if (result['result'] != null) {
      List<CartItemModel> data =
          List<Map<String, dynamic>>.from(result['result'])
              .map(CartItemModel.fromJson)
              .toList();

      return CartResult<List<CartItemModel>>.success(data);
    } else {
      return CartResult.error(tErrorCartItem);
    }
  }

  Future<bool> changeItemQuantity({
    required String cartItemId,
    required int quantity,
    required String token,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.changeItemQuantity,
      method: HttpMethod.post,
      body: {
        'cartItemId': cartItemId,
        'quantity': quantity,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );

    return result.isEmpty;
  }

  Future<CartResult<String>> addItemToCart({
    required String userId,
    required String token,
    required productId,
    required int quantity,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.addCartItems,
      method: HttpMethod.post,
      body: {
        'user': userId,
        'quantity': quantity,
        'productId': productId,
      },
      headers: {
        'X-Parse-Session-Token': token,
      },
    );
    if (result['result'] != null) {
      return CartResult<String>.success(result['result']['id']);
    } else {
      return CartResult.error(tErrorAddCartItem);
    }
  }
}
