import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/products/products_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';

class CategoryList extends StatelessWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        String? selectedCategory;
        if (state is ProductsSuccess) {
          selectedCategory = state.selectedCategory;
        }

        return SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              final isSelected = category == selectedCategory;

              return Padding(
                padding: AppPaddings.h8,
                child: GestureDetector(
                  onTap: () {
                    context.read<ProductsCubit>().filterProductsByCategory(
                          isSelected ? null : category,
                        );
                  },
                  child: Chip(
                    label: Text(category),
                    backgroundColor:
                        isSelected ? AppColors.green : AppColors.white,
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.white : AppColors.green,
                    ),
                    side: BorderSide(
                      color: isSelected ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
