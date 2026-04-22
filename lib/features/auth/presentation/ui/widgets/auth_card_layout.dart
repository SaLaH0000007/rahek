import 'package:flutter/material.dart';
import '../../../../../core/theme/app_colors_light.dart';
import '../../../../../core/theme/app_sizes.dart';

class AuthCardLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final Widget formContent;
  final Widget bottomAction;

  const AuthCardLayout({
    super.key,
    required this.title,
    required this.subtitle,
    required this.formContent,
    required this.bottomAction,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(AppSizes.p24),
        child: Column(
          children: [
            SizedBox(height: AppSizes.p32),
            Container(
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(AppSizes.r16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Orange Header
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: AppSizes.p32),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(AppSizes.r16),
                      ),
                    ),
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(AppSizes.p16),
                          decoration: const BoxDecoration(
                            color: AppColors.background,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.person_outline,
                            color: AppColors.primary,
                            size: AppSizes.s32,
                          ),
                        ),
                        SizedBox(height: AppSizes.p16),
                        Text(
                          title,
                          style: TextStyle(
                            color: AppColors.background,
                            fontSize: AppSizes.f22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: AppSizes.p8),
                        Text(
                          subtitle,
                          style: TextStyle(
                            color: AppColors.background.withOpacity(0.9),
                            fontSize: AppSizes.f14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Form Content
                  Padding(
                    padding: EdgeInsets.all(AppSizes.p24),
                    child: formContent,
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSizes.p32),
            bottomAction,
          ],
        ),
      ),
    );
  }
}
