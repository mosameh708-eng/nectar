import 'package:dio/dio.dart';

import '../models/user.dart';

class AuthRepository {
  static const String _baseUrl = 'https://sonic-zdi0.onrender.com/api';
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {'Content-Type': 'application/json'},
      responseType: ResponseType.json,
    ),
  );

  Future<User> login({
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/login',
      data: {'email': email, 'password': password},
    );

    final body = response.data as Map<String, dynamic>;
    if (response.statusCode == 200) {
      return User.fromJson(body['data'] as Map<String, dynamic>);
    }

    throw Exception(body['message'] ?? 'Login failed');
  }

  Future<User> register({
    required String name,
    required String email,
    required String password,
  }) async {
    final response = await _dio.post(
      '/register',
      data: {'name': name, 'email': email, 'password': password},
    );

    final body = response.data as Map<String, dynamic>;
    if (response.statusCode == 201 || response.statusCode == 200) {
      return User.fromJson(body['data'] as Map<String, dynamic>);
    }

    throw Exception(body['message'] ?? 'Registration failed');
  }
}
