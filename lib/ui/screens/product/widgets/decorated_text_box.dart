import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/extensions/num_extensions.dart';

class DecoratedTextBox extends StatelessWidget {
  final String text;
  final Icon? icon;

  const DecoratedTextBox({
    super.key,
    required this.text,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.grey[200], 
        borderRadius: AppRadiuses.a16, 
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              icon!, 
              8.w,
            ],
            Text(
              text,
              style: TextStyle(color: AppColors.black,fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
