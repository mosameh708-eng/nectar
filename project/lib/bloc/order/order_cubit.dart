import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_item.dart';
import '../../models/order.dart';
import '../../repositories/storage_repository.dart';
import 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final StorageRepository storageRepository;

  OrderCubit({required this.storageRepository}) : super(const OrderState()) {
    _loadSavedOrders();
  }

  void addOrder(List<CartItem> items) {
    final total = items.fold(
      0.0,
      (sum, item) => sum + ((double.tryParse(item.product.price) ?? 0.0) * item.quantity),
    );

    final order = Order(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      items: items,
      total: total,
      date: DateTime.now(),
    );

    final updatedOrders = [...state.orders, order];
    emit(state.copyWith(orders: updatedOrders));
    storageRepository.saveOrders(updatedOrders);
  }

  Future<void> _loadSavedOrders() async {
    final savedOrders = await storageRepository.loadOrders();
    if (savedOrders.isNotEmpty) {
      emit(state.copyWith(orders: savedOrders));
    }
  }
}
