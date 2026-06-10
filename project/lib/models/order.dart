import 'package:equatable/equatable.dart';

import 'cart_item.dart';

class Order extends Equatable {
  final String id;
  final List<CartItem> items;
  final double total;
  final DateTime date;

  const Order({
    required this.id,
    required this.items,
    required this.total,
    required this.date,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'] as String,
      items: (json['items'] as List<dynamic>)
          .cast<Map<String, dynamic>>()
          .map((itemJson) => CartItem.fromJson(itemJson))
          .toList(),
      total: (json['total'] as num).toDouble(),
      date: DateTime.parse(json['date'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [id, items, total, date];
}
