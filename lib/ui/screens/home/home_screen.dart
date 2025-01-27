import 'package:flutter/material.dart';

import '../../../utils/constants/app_texts.dart';
import '../../../utils/extensions/num_extensions.dart';
import '../../widgets/custom_app_bar.dart';
import 'widgets/bilboard.dart';
import 'widgets/custom_search_bar.dart';

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
          ],
        ),
      ),
    );
  }
}
