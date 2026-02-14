import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/product_controller.dart';
import '../data/models/product_model.dart';

class AddEditProductDialog {
  static void show({Product? product, int? index}) {
    final controller = Get.find<ProductController>();

    final titleController =
    TextEditingController(text: product?.title ?? "");
    final priceController =
    TextEditingController(text: product?.price.toString() ?? "");
    final thumbnailController =
    TextEditingController(text: product?.thumbnail ?? "");

    Get.dialog(
      AlertDialog(
        title: Text(product == null ? "Add Product" : "Edit Product"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: const InputDecoration(labelText: "Title"),
              ),
              TextField(
                controller: priceController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: "Price"),
              ),
              TextField(
                controller: thumbnailController,
                decoration: const InputDecoration(labelText: "Image URL"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () async {
              if (titleController.text.isEmpty ||
                  priceController.text.isEmpty) {
                Get.snackbar("Error", "Please fill all fields");
                return;
              }
              if (product == null) {
                final newProduct = Product(
                  title: titleController.text,
                  price: double.parse(priceController.text),
                  thumbnail: thumbnailController.text,
                );

                await controller.addProduct(newProduct);
              } else {
                final updatedProduct = Product(
                  id: product.id,
                  title: titleController.text,
                  price: double.parse(priceController.text),
                  thumbnail: thumbnailController.text,
                );

                await controller.updateProduct(index!, updatedProduct);
              }

              Get.back();
            },
            child: Text(product == null ? "Add" : "Update"),
          ),
        ],
      ),
    );
  }
}
