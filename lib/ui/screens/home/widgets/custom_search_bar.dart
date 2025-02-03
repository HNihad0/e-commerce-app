import 'package:e_commerce_app/utils/constants/app_radiuses.dart';
import 'package:flutter/material.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';


class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomSearchBar({
    super.key,
    this.hintText = 'Search',
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppColors.whiteSmoke,
        borderRadius: AppRadiuses.a16, 
        border: Border.all(
          color: AppColors.whiteSmoke,
          width: 1,
        ),
      ),
      child: Padding(
        padding: AppPaddings.a6,
        child: TextField(
          controller: controller,
          onChanged: (query) {
            if (onChanged != null) {
              onChanged!(query);
            }
          },
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: AppPaddings.a12,
            border: InputBorder.none,
            suffixIcon: Icon(
              Icons.search,
              color: AppColors.black,
            ),
          ),
        ),
      ),
    );
  }
}
