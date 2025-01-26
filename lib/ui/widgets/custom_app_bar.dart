import 'package:flutter/material.dart';

import '../../utils/constants/app_paddings.dart';
import '../../utils/constants/app_radiuses.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title != null
          ? Padding(
            padding: AppPaddings.a6,
            child: Text(title!,style: TextStyle(fontSize: 26),),
          )
          : null,
      actions: actions?.map((action) {
        return Padding(
          padding: AppPaddings.h8,
          child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey, 
              ),
              borderRadius: AppRadiuses.a30,
            ),
            child: action,
          ),
        );
      }).toList(),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
