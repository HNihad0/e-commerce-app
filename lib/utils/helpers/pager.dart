import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/favorite/favorite_cubit.dart';
import '../../cubits/productCategories/product_categories_cubit.dart';
import '../../cubits/products/products_cubit.dart';
import '../../ui/screens/favorite/favorite_screen.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';
import '../di/locator.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();

  static Widget get home => MultiBlocProvider(
        providers: [
          BlocProvider<ProductsCubit>(
            create: (_) => locator()..getProducts(),
          ),
          BlocProvider<ProductCategoriesCubit>(
            create: (_) => locator()..getProductCategories(),
          ),
          BlocProvider<FavoriteCubit>(
            create: (_) =>
                locator<FavoriteCubit>(), 
          ),
        ],
        child: const HomeScreen(),
      );

  static Widget get favorite => BlocProvider(
        create: (_) => locator<FavoriteCubit>(),
        child: const FavoriteScreen(),
      );
}
