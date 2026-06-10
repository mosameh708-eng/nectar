import 'package:equatable/equatable.dart';

import '../../models/order.dart';

class OrderState extends Equatable {
  final List<Order> orders;

  const OrderState({this.orders = const []});

  OrderState copyWith({List<Order>? orders}) {
    return OrderState(orders: orders ?? this.orders);
  }

  @override
  List<Object?> get props => [orders];
}
