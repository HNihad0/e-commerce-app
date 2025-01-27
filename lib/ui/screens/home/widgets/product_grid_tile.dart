import 'package:flutter/material.dart';

import '../../../../data/models/remote/product_response.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    super.key,
    required this.productResponse,
  });

  final ProductResponse productResponse;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: DecoratedBox(
        decoration: BoxDecoration(color: AppColors.white),
        child: ClipRRect(
          child: Image.network(
            productResponse.image!,
            height: 150,
            fit: BoxFit.contain,
          ),
        ),
      ),
      footer: Padding(
        padding: AppPaddings.a6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productResponse.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('\$${productResponse.price}'),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow,
                      size: 18,
                    ),
                    Text('${productResponse.rating?.rate}'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: AppRadiuses.a8,
        ),
      ),
    );
  }
}
