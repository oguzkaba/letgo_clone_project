import 'package:get/state_manager.dart';
import 'package:letgo_clone_project/controller/service.dart';
import 'package:letgo_clone_project/model/product_model.dart';

class ProductController extends GetxController {
  // ignore: deprecated_member_use
  var isLoading = true.obs;
  final productList = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await RemoteServices.fetchData();
      productList.value = products;
    } finally {
      isLoading(false);
    }
  }
}
