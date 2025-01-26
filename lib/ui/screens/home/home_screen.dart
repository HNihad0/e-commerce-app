import 'package:flutter/material.dart';

import '../../../utils/constants/app_colors.dart';
import '../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_radiuses.dart';
import '../../../utils/constants/app_texts.dart';
import '../../widgets/custom_app_bar.dart';

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
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: AppColors.whiteSmoke,
            borderRadius: AppRadiuses.a16,
            border: Border.all(
              color: Colors.grey.shade300, 
              width: 1,
            ),
          ),
          child: Padding(
            padding: AppPaddings.a6,
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                contentPadding:
                    AppPaddings.a12,
                border: InputBorder.none,
                suffixIcon: Icon(
                  Icons.search,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
