import 'package:flutter/material.dart';

import '../theme/app_sizes.dart';
import 'icon_bottun.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onComparePressed;

  const CustomAppBar({
    super.key,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onComparePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      titleSpacing: AppSizes.p16,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              customIconButton(Icons.menu, onMenuPressed),

              const SizedBox(width: AppSizes.p16),
              customIconButton(Icons.swap_horiz, onComparePressed),

              const SizedBox(width: AppSizes.p16),
              customIconButton(Icons.search, onSearchPressed),
            ],
          ),

          Image.asset(
            "assets/images/logo.png",
            height: AppSizes.p35,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
