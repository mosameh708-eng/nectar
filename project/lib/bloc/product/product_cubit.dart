import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repositories/product_repository.dart';
import 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  final ProductRepository productRepository;

  ProductCubit({required this.productRepository}) : super(const ProductState());

  Future<void> loadProducts() async {
    emit(state.copyWith(status: ProductStatus.loading, errorMessage: null));
    try {
      final products = await productRepository.fetchProducts();
      emit(state.copyWith(status: ProductStatus.success, products: products));
    } catch (error) {
      emit(state.copyWith(
        status: ProductStatus.failure,
        errorMessage: error.toString().replaceFirst('Exception: ', ''),
      ));
    }
  }
}
