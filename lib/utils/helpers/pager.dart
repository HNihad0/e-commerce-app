import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubits/products/products_cubit.dart';
import '../../ui/screens/home/home_screen.dart';
import '../../ui/screens/splash/splash_screen.dart';
import '../di/locator.dart';

class Pager {
  Pager._();

  static Widget get splash => const SplashScreen();

    static Widget get home => BlocProvider<ProductsCubit>(
        create: (_) => locator()..getProducts(),
        child: const HomeScreen(),
      );
}
