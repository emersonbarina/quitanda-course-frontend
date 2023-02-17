import '../../../constants/endpoints.dart';
import '../../../services/http_manager.dart';

class CartRepository {
  final HttpManager _httpManager = HttpManager();

  Future getCartItems({
    required String token,
    required String userId,
  }) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllCategories,
      method: HttpMethod.post,
      headers: {
        'X-Parse-Session-Token': token,
      },
      body: {
        'user': userId,
      },
    );
    if (result['result'] != null) {

    } else {

    }
  }
}
