import 'package:flutter/material.dart';

import '../theme/app_sizes.dart';

Widget customIconButton(IconData icon, VoidCallback? onTap) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(20),
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Icon(icon, color: Colors.black87, size: AppSizes.iconMedium),
    ),
  );
}
