import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/order.dart';
import '../models/user.dart';

class StorageRepository {
  static const String _userKey = 'saved_user';
  static const String _ordersKey = 'saved_orders';

  Future<void> saveUser(User user) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(_userKey, jsonEncode(user.toJson()));
  }

  Future<User?> loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(_userKey);
    if (raw == null) return null;
    try {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return User.fromJson(json);
    } catch (_) {
      return null;
    }
  }

  Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userKey);
  }

  Future<void> saveOrders(List<Order> orders) async {
    final prefs = await SharedPreferences.getInstance();
    final encoded = orders.map((order) => jsonEncode(order.toJson())).toList();
    prefs.setStringList(_ordersKey, encoded);
  }

  Future<List<Order>> loadOrders() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList(_ordersKey);
    if (saved == null) return [];
    return saved.map((raw) {
      final json = jsonDecode(raw) as Map<String, dynamic>;
      return Order.fromJson(json);
    }).toList();
  }
}
