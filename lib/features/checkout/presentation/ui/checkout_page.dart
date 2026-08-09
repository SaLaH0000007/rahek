// review_order_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/checkout_stepper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/order_section_card.dart';
import '../../../../core/widgets/summary_row.dart';
import '../../../completed/presentation/ui/order_success_page.dart';
import '../../../orders/presentation/bloc/ReviewOrderState.dart';
import '../../../orders/presentation/bloc/cubit.dart';

class ReviewOrderPage extends StatelessWidget {
  const ReviewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewOrderCubit()..getOrderDetails(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const CustomAppBar(),
        body: Padding(
          // 2. استبدال size.width بـ ScreenUtil لضمان الثبات
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SingleChildScrollView(
            child: BlocBuilder<ReviewOrderCubit, ReviewOrderState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // 3. إضافة الـ Stepper والمسافات المطلوبة
                    SizedBox(height: 20.h),
                    const CheckoutStepper(currentStep: 1),
                    SizedBox(height: 20.h),

                    // عرض المحتوى بناءً على حالة الـ Cubit
                    if (state is ReviewOrderLoading)
                      const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primary,
                        ),
                      )
                    else if (state is ReviewOrderLoaded)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Please review your order details before placing it",
                            style: TextStyle(
                              color: AppColors.textSecondary,
                              fontSize: AppSizes.f13.sp,
                            ),
                          ),
                          SizedBox(height: AppSizes.p24.h),

                          // قسم المنتجات
                          OrderSectionCard(
                            title: "Order Items",
                            icon: Icons.shopping_bag_outlined,
                            child: Row(
                              children: [
                                Container(
                                  width: AppSizes.thumbnailSize.w,
                                  height: AppSizes.thumbnailSize.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.iconBackground,
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.r8.r,
                                    ),
                                  ),
                                  child: Image.asset(
                                    "assets/images/Apple_cider_vinegar.png",
                                  ),
                                ),
                                SizedBox(width: AppSizes.p12.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Product Name",
                                        style: TextStyle(
                                          fontSize: AppSizes.f14.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Quantity: 1",
                                        style: TextStyle(
                                          color: AppColors.textSecondary,
                                          fontSize: AppSizes.f12.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  "EGP ${state.subtotal}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: AppSizes.f14.sp,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // قسم ملخص الحساب
                          OrderSectionCard(
                            title: "Order Summary",
                            icon: Icons.receipt_long_outlined,
                            child: Column(
                              children: [
                                SummaryRow(
                                  label: "Subtotal",
                                  value: "EGP ${state.subtotal}",
                                ),
                                SummaryRow(
                                  label: "Shipping",
                                  value: "EGP ${state.shipping}",
                                ),
                                SummaryRow(
                                  label: "Tax",
                                  value: "EGP ${state.tax}",
                                ),
                                Divider(
                                  color: AppColors.border,
                                  height: AppSizes.p24.h,
                                ),
                                SummaryRow(
                                  label: "Total",
                                  value: "EGP ${state.total}",
                                  isBold: true,
                                ),
                              ],
                            ),
                          ),

                          // زر إتمام الطلب
                          SizedBox(
                            width: double.infinity,
                            height: AppSizes.buttonHeight.h,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => OrderSuccessPage(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.r12.r,
                                  ),
                                ),
                                elevation: 0,
                              ),
                              child: Text(
                                "Place Order",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: AppSizes.f16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          SizedBox(height: 20.h),
                        ],
                      )
                    else if (state is ReviewOrderError)
                      Center(child: Text(state.message))
                    else
                      const SizedBox.shrink(),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
