import 'package:get_it/get_it.dart';

import '../../cubits/favorite/favorite_cubit.dart';
import '../../cubits/productCategories/product_categories_cubit.dart';
import '../../cubits/products/products_cubit.dart';
import '../../data/impl_repository/i_product_repo.dart';
import '../../data/repository/products_repo.dart';
import '../../data/services/product_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => ProductsService());

  // Repositories
  locator.registerLazySingleton<ProductsRepo>(
    () => IProductsRepo(locator()),
  );

  //cubits
  locator.registerFactory(() => ProductsCubit(locator()));
  locator.registerFactory(() => ProductCategoriesCubit(locator()));
   locator.registerLazySingleton(() => FavoriteCubit());

}
