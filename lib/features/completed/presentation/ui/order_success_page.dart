import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/checkout_stepper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../home/presentation/ui/home_page.dart';


class OrderSuccessPage extends StatelessWidget {
  const OrderSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: AppSizes.p24.w),
        child: Column(
          children: [
            SizedBox(height: AppSizes.p24.h),

            // 1. Stepper
            const FittedBox(
              fit: BoxFit.scaleDown,
              child: CheckoutStepper(currentStep: 2),
            ),

            SizedBox(height: AppSizes.p35.h),

            // 2. Success Icon & Header
            const Icon(
              Icons.check_circle_outline,
              color: AppColors.success,
              size: 80,
            ),
            SizedBox(height: AppSizes.p16.h),
            const Text(
              "Order Placed Successfully!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: AppSizes.f22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: AppSizes.p8.h),
            const Text(
              "Thank you for your purchase. Your order has been received and is being processed.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: AppSizes.f14,
              ),
            ),

            SizedBox(height: AppSizes.p35.h),

            // 3. Order Details Card
            const _OrderDetailsCard(),

            SizedBox(height: AppSizes.p24.h),

            // 4. Continue Shopping Button (تم التعديل للذهاب لصفحة HoneyPage)
            TextButton.icon(
              onPressed: () {
                // الانتقال لصفحة HoneyPage ومسح كل ما قبلها لتجنب العودة لصفحة النجاح
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HoneyPage()),
                      (route) => false,
                );
              },
              icon: const Icon(
                Icons.arrow_back,
                size: AppSizes.iconSmall,
                color: AppColors.primary,
              ),
              label: const Text(
                "Continue Shopping",
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(height: AppSizes.p24.h),
            const _WhatHappensNextCard(),
            SizedBox(height: AppSizes.p35.h),
          ],
        ),
      ),
    );
  }
}

// --- Widgets المساعدة ---

class _OrderDetailsCard extends StatelessWidget {
  const _OrderDetailsCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.p16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildInfoRow("ORDER NUMBER", "#5", isGold: true),
          SizedBox(height: AppSizes.p16.h),
          _buildInfoRow("ORDER DATE", "09/02/2026", isGold: false),
          SizedBox(height: AppSizes.p16.h),

          Container(
            padding: EdgeInsets.all(AppSizes.p12.w),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(AppSizes.r8),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.email_outlined, color: Colors.blue, size: AppSizes.iconMedium),
                SizedBox(width: AppSizes.p12.w),
                Expanded(
                  child: Text(
                    "A confirmation email has been sent to test@gmail.com\nPlease check your spam folder if you don't see it in your inbox.",
                    style: TextStyle(fontSize: AppSizes.f11.sp, color: Colors.black87),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSizes.p24.h),
          const Row(
            children: [
              Icon(Icons.inventory_2_outlined, size: AppSizes.iconSmall),
              SizedBox(width: AppSizes.p8),
              Text("Order Summary", style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.f14)),
            ],
          ),
          const Divider(),

          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(width: 50.w, height: 50.h, color: AppColors.border),
            title: const Text("Product", style: TextStyle(fontSize: AppSizes.f14, fontWeight: FontWeight.bold)),
            subtitle: const Text("Qty: 1", style: TextStyle(color: AppColors.textSecondary)),
            trailing: const Text("EGP 25.00", style: TextStyle(fontWeight: FontWeight.bold)),
          ),

          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total", style: TextStyle(fontSize: AppSizes.f18, fontWeight: FontWeight.bold)),
              const Text("EGP 35.00", style: TextStyle(fontSize: AppSizes.f18, fontWeight: FontWeight.bold, color: AppColors.primary)),
            ],
          ),

          SizedBox(height: AppSizes.p16.h),

          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.border),
                padding: EdgeInsets.symmetric(vertical: AppSizes.p12.h),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.r8)),
              ),
              onPressed: () {},
              icon: const Icon(Icons.print_outlined, color: Colors.black54),
              label: const Text("Print Order", style: TextStyle(color: Colors.black87)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String title, String value, {required bool isGold}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: TextStyle(color: AppColors.textSecondary, fontSize: AppSizes.f11.sp)),
        Text(value, style: TextStyle(
          color: isGold ? AppColors.primary : AppColors.textPrimary,
          fontSize: AppSizes.f20.sp,
          fontWeight: FontWeight.bold,
        )),
      ],
    );
  }
}

class _WhatHappensNextCard extends StatelessWidget {
  const _WhatHappensNextCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(AppSizes.p16.w),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.r12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("What Happens Next?", style: TextStyle(fontWeight: FontWeight.bold, fontSize: AppSizes.f16)),
          SizedBox(height: AppSizes.p16.h),
          _buildBullet("You will receive an order confirmation email with details of your order."),
          _buildBullet("We will notify you when your order has been shipped."),
          _buildBullet("You can track your order status in the My Orders section of your account."),
        ],
      ),
    );
  }

  Widget _buildBullet(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSizes.p12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: AppSizes.p4.h),
            child: Icon(Icons.circle, size: AppSizes.p8, color: AppColors.primary),
          ),
          SizedBox(width: AppSizes.p12.w),
          Expanded(child: Text(text, style: const TextStyle(color: AppColors.textSecondary, fontSize: AppSizes.f13))),
        ],
      ),
    );
  }
}