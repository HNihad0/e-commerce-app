import 'package:flutter/material.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';

class AddToCartButton extends StatelessWidget {
  final String price;
  final VoidCallback onPressed;

  const AddToCartButton({
    super.key,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Text(
            "\$ $price",
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          Spacer(),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.green,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              minimumSize: Size(225, 75),
              shape: RoundedRectangleBorder(
                borderRadius: AppRadiuses.a20,
              ),
            ),
            child: Text(
              "Add to Cart",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
