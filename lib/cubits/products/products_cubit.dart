import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/remote/product_response.dart';
import '../../data/repository/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitial());

  final ProductsRepo _productsRepo;
  String? selectedCategory; 

  void getProducts() async {
    try {
      emit(ProductsLoading());
      final products = await _productsRepo.getProducts();
      emit(ProductsSuccess(products));
    } on SocketException {
      emit(ProductsNetworkError());
    } catch (e) {
      emit(ProductsError(message: '$e'));
    }
  }

  void filterProductsByCategory(String? category) {
  if (state is ProductsSuccess) {
    final allProducts = (state as ProductsSuccess).products;

    final filteredProducts = category == null || category.isEmpty
        ? allProducts
        : allProducts.where((product) => product.category == category).toList();

    // Yeni durum yayınla
    emit(ProductsSuccess(filteredProducts, selectedCategory: category));
  }
}

}
