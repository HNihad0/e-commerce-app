import 'package:flutter/material.dart';

import '../../../../data/models/remote/product_response.dart';

class ProductGridTile extends StatelessWidget {
  const ProductGridTile({
    super.key,
    required this.productResponse,
  });

  final ProductResponse productResponse;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      header: Image.network(
        productResponse.image!,
        height: 120,
      ),
      footer: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              productResponse.title ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              productResponse.description ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            Text('Price: ${productResponse.price}'),
            Text(productResponse.category),
          ],
        ),
      ),
      child: Card(
        color: Colors.white60,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
