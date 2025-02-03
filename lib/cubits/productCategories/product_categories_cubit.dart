import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repository/products_repo.dart';

part 'product_categories_state.dart';

class ProductCategoriesCubit extends Cubit<ProductCategoriesState> {
  ProductCategoriesCubit(this._productsRepo)
      : super(ProductCategoriesInitial());

  final ProductsRepo _productsRepo;

  void getProductCategories() async {
    try {
      emit(ProductCategoriesLoading());
      final products = await _productsRepo.getCategories();
      emit(ProductCategoriesSuccess(products));
    } on SocketException {
      emit(ProductCategoriesNetworkError());
    } catch (e) {
      emit(ProductCategoriesError(message: '$e'));
    }
  }
}
