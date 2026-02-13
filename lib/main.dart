import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/product_controller.dart';
import 'views/product_screen.dart';
import 'bindings/product_binding.dart';

void main(){
  Get.put(ProductController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ProductBinding(),
      home: ProductScreen(),
    );
  }
}