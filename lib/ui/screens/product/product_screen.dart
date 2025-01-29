import 'package:flutter/material.dart';
import '../../../../data/models/remote/product_response.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../utils/constants/app_colors.dart';
import '../../../utils/extensions/num_extensions.dart';
import 'widgets/decorated_text_box.dart';
import 'widgets/product_button.dart';
import 'widgets/select_chip.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductResponse product;
  final ValueNotifier<int> selectedChipIndex = ValueNotifier<int>(-1);
  final ValueNotifier<bool> isFavorite = ValueNotifier<bool>(false);

  ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          ValueListenableBuilder<bool>(
            valueListenable: isFavorite,
            builder: (context, isFav, _) {
              return ElevatedButton(
                onPressed: () {
                  isFavorite.value = !isFav;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.white,
                  shape: CircleBorder(),
                  padding: AppPaddings.a16,
                ),
                child: Icon(
                  Icons.favorite,
                  color: isFav ? AppColors.cinnabar : AppColors.grey, 
                ),
              );
            },
          )
        ],
      ),
      body: Padding(
        padding: AppPaddings.a16.copyWith(top: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                product.image!,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title ?? '',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  15.h,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DecoratedTextBox(
                        icon: Icon(Icons.star, color: Colors.orange),
                        text: '${product.rating?.rate}',
                      ),
                      10.w,
                      Text(
                        "Reviews: ${product.rating?.count}",
                        style: TextStyle(
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ),
                  16.h,
                  Text(
                    product.description ?? 'No description available.',
                    style: TextStyle(fontSize: 14),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  20.h,
                  ValueListenableBuilder<int>(
                    valueListenable: selectedChipIndex,
                    builder: (context, selectedIndex, _) {
                      return Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: List.generate(3, (index) {
                          return SelectChip(
                            index: index,
                            isSelected: selectedIndex == index,
                            onTap: () {
                              selectedChipIndex.value =
                                  (selectedIndex == index) ? -1 : index;
                            },
                          );
                        }),
                      );
                    },
                  ),
                  Spacer(),
                  AddToCartButton(
                    price: "${product.price}",
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
