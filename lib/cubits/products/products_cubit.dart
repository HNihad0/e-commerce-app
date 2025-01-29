import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/remote/product_response.dart';
import '../../data/repository/products_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productsRepo) : super(ProductsInitial());

  final ProductsRepo _productsRepo;
  List<ProductResponse> _allProducts = []; 
  String? selectedCategory;

  void getProducts() async {
    try {
      emit(ProductsLoading());
      _allProducts = await _productsRepo.getProducts();
      emit(ProductsSuccess(_allProducts, selectedCategory: null));
    } on SocketException {
      emit(ProductsNetworkError());
    } catch (e) {
      emit(ProductsError(message: '$e'));
    }
  }

  void filterProductsByCategory(String? category) {
    if (state is ProductsSuccess) {
      final filteredProducts = category == null
          ? _allProducts
          : _allProducts.where((product) => product.category == category).toList();

      selectedCategory = category;
      emit(ProductsSuccess(filteredProducts, selectedCategory: category));
    }
  }
}
