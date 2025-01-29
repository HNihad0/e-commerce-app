import 'package:e_commerce_app/utils/constants/app_paddings.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/remote/product_response.dart';
import 'product_grid_tile.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key,
    required this.products,
  });

  final List<ProductResponse> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: AppPaddings.a16,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 230,
      ),
      shrinkWrap: true, // GridView'un Column içinde doğru çalışmasını sağlar
      physics: const NeverScrollableScrollPhysics(), // GridView'un kendi kaydırmasını kapatır
      itemBuilder: (_, i) {
        final product = products[i];
        return ProductGridTile(productResponse: product);
      },
    );
  }
}
