part of 'product_categories_cubit.dart';

@immutable
sealed class ProductCategoriesState {}

final class ProductCategoriesInitial extends ProductCategoriesState {}

class ProductCategoriesLoading extends ProductCategoriesState {}

class ProductCategoriesSuccess extends ProductCategoriesState {
  ProductCategoriesSuccess(this.products);

  final List<String> products;
}

class ProductCategoriesError extends ProductCategoriesState {
  ProductCategoriesError({this.message = 'Error Occured'});

  final String message;
}

class ProductCategoriesNetworkError extends ProductCategoriesState {
  ProductCategoriesNetworkError({this.message = 'Network Error Occured'});

  final String message;
}
