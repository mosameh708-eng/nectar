import 'package:dio/dio.dart';

import '../models/product.dart';

class ProductRepository {
  static const String _baseUrl = 'https://sonic-zdi0.onrender.com/api';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      responseType: ResponseType.json,
    ),
  );

  Future<List<Product>> fetchProducts() async {
    final response = await _dio.get('/products');
    final body = response.data as Map<String, dynamic>;

    if (response.statusCode == 200) {
      final data = body['data'] as List<dynamic>;
      return data
          .cast<Map<String, dynamic>>()
          .map((json) => Product.fromJson(json))
          .toList();
    }

    throw Exception(body['message'] ?? 'Unable to load products');
  }
}
