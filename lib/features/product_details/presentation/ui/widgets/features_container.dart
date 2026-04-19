import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';
import '../../../../../core/widgets/feature_list_tile.dart';

Widget features_container() {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.border),
      borderRadius: BorderRadius.circular(AppSizes.r8),
    ),
    child: Column(
      children: const [
        FeatureListTile(
          icon: Icons.local_shipping,
          title: 'Free Shipping & Returns',
          subtitle: 'For all orders over 1000 EGP',
        ),
        Divider(height: 1),
        FeatureListTile(
          icon: Icons.security,
          title: 'Secure Payment',
          subtitle: 'We ensure secure payment',
        ),
        Divider(height: 1),
        FeatureListTile(
          icon: Icons.money_off,
          title: 'Money Back Guarantee',
          subtitle: 'Any back within 30 days',
        ),
      ],
    ),
  );
}
