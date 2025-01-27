import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../cubits/products/products_cubit.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';

class CategoryList extends StatefulWidget {
  final List<String> categories;

  const CategoryList({super.key, required this.categories});

  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  int? _selectedCategoryIndex;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categories.length,
        itemBuilder: (context, index) {
          final category = widget.categories[index];
          final isSelected = index == _selectedCategoryIndex;

          return Padding(
            padding: AppPaddings.h8,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCategoryIndex = isSelected ? null : index;
                  context.read<ProductsCubit>().filterProductsByCategory(category);
                });
              },
              child: Chip(
                label: Text(category),
                backgroundColor: isSelected
                    ? AppColors.green 
                    : AppColors.white, 
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
  }
}
