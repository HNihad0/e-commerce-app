import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';

class SelectChip extends StatelessWidget {
  final int index;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectChip({
    super.key,
    required this.index,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    String label = index == 0
        ? '1 TB'
        : index == 1
            ? '825 GB'
            : '500 GB';

    return GestureDetector(
      onTap: onTap,
      child: Chip(
        label: Text(
          label,
          style: TextStyle(
            color: isSelected ? AppColors.white : AppColors.black,
          ),
        ),
        backgroundColor: isSelected ? AppColors.green : Colors.transparent,
        side: BorderSide(
          color: isSelected ? Colors.transparent : AppColors.black,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}