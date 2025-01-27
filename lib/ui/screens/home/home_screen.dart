import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/products/products_cubit.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/global_loading.dart';
import 'widgets/bilboard.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/product_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.homeAppBarTexts,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_bag,
              size: 22,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomSearchBar(),
            20.h,
            const ClearanceSalesBox(),
            15.h,
            Expanded(
              child: BlocConsumer<ProductsCubit, ProductsState>(
                listener: (context, state) {
                  if (state is ProductsSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('All Products fetched successfully.'),
                      ),
                    );
                  } else if (state is ProductsNetworkError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Network Error occurred.'),
                      ),
                    );
                  }
                },
                builder: (_, state) {
                  log(state.runtimeType.toString());
                  if (state is ProductsLoading || state is ProductsInitial) {
                    return const GlobalLoading();
                  } else if (state is ProductsSuccess) {
                    return ProductGridView(products: state.products);
                  } else if (state is ProductsNetworkError) {
                    return Text(state.message);
                  } else if (state is ProductsError) {
                    return Text(state.message);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
