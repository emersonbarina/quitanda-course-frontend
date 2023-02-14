import 'package:quitanda/scr/models/category_model.dart';
import 'package:quitanda/scr/models/item_model.dart';
import 'package:quitanda/scr/pages/home/result/home_result.dart';

import '../../../constants/endpoints.dart';
import '../../../constants/texts_message_errors.dart';
import '../../../services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  Future<HomeResult<CategoryModel>> getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllCategories,
      method: HttpMethod.post,
    );
    if (result['result'] != null) {
      List<CategoryModel> data =
          (List<Map<String, dynamic>>.from(result['result']))
              .map(CategoryModel.fromJson)
              .toList();

      return HomeResult<CategoryModel>.success(data);
    } else {
      return HomeResult.error(tErrorUndefinedCategories);
    }
  }

  Future<HomeResult<ItemModel>> getAllProducts(Map<String, dynamic> body) async {
    final result = await _httpManager.restRequest(
      url: EndPoints.getAllProducts,
      method: HttpMethod.post,
      body: body
    );

    if (result['result'] != null) {
      List<ItemModel> data = (List<Map<String, dynamic>>.from(result['result']))
          .map(ItemModel.fromJson)
          .toList();

      return HomeResult<ItemModel>.success(data);
    } else {
      return HomeResult.error(tErrorUndefinedProducts);
    }
  }
}
