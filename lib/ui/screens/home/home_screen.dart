import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubits/productCategories/product_categories_cubit.dart';
import '../../../cubits/products/products_cubit.dart';
import '../../../utils/constants/app_texts.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../../utils/helpers/go.dart';
import '../../../utils/helpers/pager.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_navbar.dart';
import '../../widgets/global_loading.dart';
import 'widgets/bilboard.dart';
import 'widgets/category_list.dart';
import 'widgets/custom_search_bar.dart';
import 'widgets/product_grid_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> selectedIndexNotifier = ValueNotifier<int>(0);

    return Scaffold(
      appBar: CustomAppBar(
        title: AppTexts.homeAppBarTexts,
        actions: [
          IconButton(
            onPressed: () {
              Go.to(context, Pager.favorite);
            },
            icon: const Icon(
              Icons.favorite,
              size: 22,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 18.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomSearchBar(
                onChanged: (query) {
                  context.read<ProductsCubit>().filterProductsByName(query);
                },
              ),
              20.h,
              const ClearanceSalesBox(),
              StreamBuilder<ProductCategoriesState>(
                stream: BlocProvider.of<ProductCategoriesCubit>(context).stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data;
                    if (state is ProductsLoading) {
                      return const GlobalLoading();
                    } else if (state is ProductCategoriesSuccess) {
                      return CategoryList(categories: state.productCategories);
                    } else if (state is ProductCategoriesNetworkError) {
                      return Text(state.message);
                    } else if (state is ProductCategoriesError) {
                      return Text(state.message);
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
              15.h,
              StreamBuilder<ProductsState>(
                stream: BlocProvider.of<ProductsCubit>(context).stream,
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    final state = snapshot.data;
                    if (state is ProductsLoading) {
                      return const GlobalLoading();
                    } else if (state is ProductsSuccess) {
                      return ProductGridView(products: state.products);
                    } else if (state is ProductsNetworkError) {
                      return Text(state.message);
                    } else if (state is ProductsError) {
                      return Text(state.message);
                    }
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ValueListenableBuilder<int>(
        valueListenable: selectedIndexNotifier,
        builder: (context, selectedIndex, child) {
          return BottomNavBar(
            selectedIndex: selectedIndex,
            onItemTapped: (index) {
              selectedIndexNotifier.value = index;
            },
          );
        },
      ),
    );
  }
}
