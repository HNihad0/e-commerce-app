import 'package:flutter/material.dart';

import '../../../../utils/constants/app_assets.dart';
import '../../../../utils/constants/app_colors.dart';
import '../../../../utils/constants/app_paddings.dart';
import '../../../../utils/constants/app_radiuses.dart';
import '../../../../utils/extensions/num_extensions.dart';

class ClearanceSalesBox extends StatelessWidget {
  const ClearanceSalesBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.lightGreen,
          borderRadius: AppRadiuses.a16,
          border: Border.all(
            color: AppColors.whiteSmoke,
            width: 2,
          ),
        ),
        child: Padding(
          padding: AppPaddings.a16,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: AppPaddings.a6,
                    child: Text(
                      'Clearance \nSales',
                      style: TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                  16.h,
                  DecoratedBox(
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: AppRadiuses.a20,
                      border: Border.all(
                        color: AppColors.whiteSmoke,
                        width: 2,
                      ),
                    ),
                    child: Padding(
                      padding: AppPaddings.a8,
                      child: Text(
                        '% \t Up to 50%',
                        style: TextStyle(
                          fontSize: 18,
                          color: AppColors.lightGreen,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                AppAssets.boxImage,
              )
            ],
          ),
        ),
      ),
    );
  }
}
