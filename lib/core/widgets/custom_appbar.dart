import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../theme/app_sizes.dart';
import 'icon_bottun.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isMenuOpen;
  final VoidCallback? onMenuPressed;
  final VoidCallback? onSearchPressed;
  final VoidCallback? onComparePressed;

  const CustomAppBar({
    super.key,
    this.isMenuOpen = false,
    this.onMenuPressed,
    this.onSearchPressed,
    this.onComparePressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: AppSizes.O,
      automaticallyImplyLeading: false,
      titleSpacing: AppSizes.p16,

      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              customIconButton(
                icon: isMenuOpen ? Icons.close : Icons.menu,
                onTap: onMenuPressed,
              ),
              SizedBox(width: AppSizes.p16),
              customIconButton(icon: Icons.swap_horiz, onTap: onComparePressed),
              SizedBox(width: AppSizes.p16),
              customIconButton(icon: Icons.search, onTap: onSearchPressed),
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
