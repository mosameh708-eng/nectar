import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cart_item.dart';
import '../../models/product.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  void addProduct(Product product) {
    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex >= 0) {
      final existingItem = state.items[existingIndex];
      final updatedItem = existingItem.copyWith(
        quantity: existingItem.quantity + 1,
      );
      final updatedItems = List.of(state.items);
      updatedItems[existingIndex] = updatedItem;
      emit(state.copyWith(items: updatedItems));
      return;
    }

    emit(
      state.copyWith(
        items: [
          ...state.items,
          CartItem(product: product, quantity: 1),
        ],
      ),
    );
  }

  void removeProduct(Product product) {
    final updatedItems = state.items
        .where((item) => item.product.id != product.id)
        .toList();
    emit(state.copyWith(items: updatedItems));
  }

  void updateQuantity(Product product, int quantity) {
    if (quantity <= 0) {
      removeProduct(product);
      return;
    }

    final existingIndex = state.items.indexWhere(
      (item) => item.product.id == product.id,
    );
    if (existingIndex < 0) return;

    final updatedItems = List.of(state.items);
    updatedItems[existingIndex] = updatedItems[existingIndex].copyWith(
      quantity: quantity,
    );
    emit(state.copyWith(items: updatedItems));
  }

  void clearCart() {
    emit(const CartState());
  }
}
