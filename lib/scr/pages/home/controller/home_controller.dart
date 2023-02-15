import 'package:get/get.dart';
import 'package:quitanda/scr/constants/app_config.dart';
import 'package:quitanda/scr/models/item_model.dart';
import 'package:quitanda/scr/pages/home/repository/home_repository.dart';
import 'package:quitanda/scr/pages/home/result/home_result.dart';
import 'package:quitanda/scr/services/utils_services.dart';

import '../../../models/category_model.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilServices = UtilsServices();

  bool isLoading = false;
  List<CategoryModel> allCategories = [];
  CategoryModel? currentCategory;
  List<ItemModel> get allProducts => currentCategory?.items ?? [];

  // other form use GetX
  void setLoading(bool value) {
    isLoading = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getAllCategories();
  }

  void selectCategory(CategoryModel category) {
    currentCategory = category;
    update();

    if (currentCategory!.items.isNotEmpty) return;

    getAllProducts();
  }

  Future<void> getAllCategories() async {
    setLoading(true);
    HomeResult<CategoryModel> homeResult =
        await homeRepository.getAllCategories();
    setLoading(false);

    homeResult.when(
      success: (data) {
        allCategories.assignAll(data);

        if (allCategories.isEmpty) return;
        selectCategory(allCategories.first);
      },
      error: (message) {
        utilServices.showToast(
          message: message,
          isError: true,
        );
      },
    );
  }

  Future<void> getAllProducts() async {
    setLoading(true);

    Map<String, dynamic> body = {
      'page': currentCategory!.pagination,
      'categoryId': currentCategory!.id,
      'itemsPerPage': tItemsPerPage,
    };

    HomeResult<ItemModel> result = await homeRepository.getAllProducts(
      body,
    );
    setLoading(false);

    result.when(
      success: (data) {
        currentCategory!.items = data;
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
