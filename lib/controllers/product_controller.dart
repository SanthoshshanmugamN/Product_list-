import 'package:get/get.dart';
import '../data/models/product_model.dart';
import '../data/service/api_service.dart';

class ProductController extends GetxController {
  final ApiService apiService = ApiService();

  RxList<Product> products = <Product>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }
  void fetchProducts() async {
    try {
      isLoading.value = true;
      final data = await apiService.getallProducts();
      products.assignAll(
        data.map((e) => Product.fromJson(e)).toList(),
      );
    } catch (e) {
      Get.snackbar("Error", "Failed to fetch products");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addProduct(Product product) async {
    try {
      final res = await apiService.createallProducts(product.toJson());
      products.insert(0, Product.fromJson(res));
      Get.snackbar("Success", "Product Added");
    } catch (e) {
      Get.snackbar("Failed", "Add Failed");
    }
  }

  Future<void> updateProduct(int index, Product product) async {
    products[index] = product;
    products.refresh(); // Needed when replacing object
    Get.snackbar("Success", "Updated Successfully");
  }

  Future<void> deleteProduct(int index) async {
    products.removeAt(index);
    Get.snackbar("Success", "Deleted Successfully");
  }
}
