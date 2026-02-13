import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
        BaseOptions(
          baseUrl: "https://dummyjson.com",
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          headers: {
            "Content-Type": "application/json",
          },
        ));
  }

  Future<List<dynamic>> getallProducts() async{
    try {
      Response res = await dio.get("/products");
      return res.data["products"];
    }
    catch(e){
      print("unExcepted Error ${e}");
      throw Exception("Failed to fetch all products");
    }

  }
  Future<Map<String,dynamic>> createallProducts(Map<String,dynamic>productData) async{
    try{
      Response res = await dio.post(
          "/products/add",
         data: productData,
      );
      return res.data;
    }
    catch(e){
      print("UnExcepted Error ${e}");
      throw Exception("Failed to create a products");
    }
  }
  Future<Map<String,dynamic>> updateProducts(int id ,Map<String,dynamic>updateData) async{
    try{
      Response res = await dio.put(
        "/products/${id}",
        data: updateData
      );
      return res.data;
    }
    catch(e){
      print("UnExcepted Error ${e}");
      throw Exception("Failed to create a products");
    }
  }
  Future<Map<String,dynamic>> deleteUsers(int id) async{
    try{
      Response res = await dio.delete(
        "/products/${id}",
      );
      return res.data;
    }
    catch(e){
      print("Delete Error : ${e}");
      throw Exception("Failed to delete user");
    }
  }
}
