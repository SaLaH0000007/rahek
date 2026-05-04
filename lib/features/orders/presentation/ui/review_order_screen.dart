// review_order_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/checkout_stepper.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/order_section_card.dart';
import '../../../../core/widgets/summary_row.dart';
// تأكدي من استيراد ملف الـ Stepper الجديد هنا
// import 'path_to_your_stepper/checkout_stepper.dart';
import '../bloc/ReviewOrderState.dart';
import '../bloc/cubit.dart';

class ReviewOrderPage extends StatelessWidget {
  const ReviewOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReviewOrderCubit()..getOrderDetails(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(),
        body: BlocBuilder<ReviewOrderCubit, ReviewOrderState>(
          builder: (context, state) {
            if (state is ReviewOrderLoading) {
              return const Center(child: CircularProgressIndicator(color: Color(0xFFD4A056)));
            }
            if (state is ReviewOrderLoaded) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),

                    // استخدام الـ Widget الجديدة مع توسيطها
                    const Center(
                      child: CheckoutStepper(currentStep: 2),
                    ),

                    SizedBox(height: 30.h),

                    Text("Review Your Order",
                        style: TextStyle(fontSize: 22.sp, fontWeight: FontWeight.bold, color: Colors.black)),
                    Text("Please review your order details before placing it",
                        style: TextStyle(fontSize: 13.sp, color: Colors.grey[600])),

                    SizedBox(height: 25.h),

                    // 1. Order Items Section
                    OrderSectionCard(
                      title: "Order Items",
                      icon: Icons.public_outlined,
                      child: Row(
                        children: [
                          Image.asset("assets/images/Apple_cider_vinegar.png",
                              width: 50.w, height: 70.h, fit: BoxFit.contain),
                          SizedBox(width: 15.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("خل 275 مل", style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600)),
                                Text("Quantity: 1", style: TextStyle(color: Colors.grey, fontSize: 12.sp)),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("EGP ${state.subtotal}.00", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp)),
                              Text("EGP ${state.subtotal}.00", style: TextStyle(color: Colors.grey, fontSize: 11.sp)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    OrderSectionCard(
                      title: "Shipping Address",
                      icon: Icons.location_on_outlined,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Test Test", style: TextStyle(fontSize: 13.sp, color: Colors.grey[700])),
                          Text("Test", style: TextStyle(fontSize: 13.sp, color: Colors.grey[700])),
                          Text("test@gmail.com", style: TextStyle(fontSize: 13.sp, color: Colors.grey[700])),
                          Text("Phone: 01155432588", style: TextStyle(fontSize: 13.sp, color: Colors.grey[700])),
                        ],
                      ),
                    ),

                    // 3. Payment & Shipping Section
                    OrderSectionCard(
                      title: "Payment & Shipping",
                      child: Column(
                        children: [
                          _buildSubSection(Icons.credit_card_outlined, "Payment Method", "Cash on delivery"),
                          SizedBox(height: 15.h),
                          _buildSubSection(Icons.local_shipping_outlined, "Shipping Method", "Standard Shipping"),
                        ],
                      ),
                    ),

                    // 4. Order Summary Section
                    OrderSectionCard(
                      title: "Order Summary",
                      child: Column(
                        children: [
                          SummaryRow(label: "Subtotal", value: "EGP ${state.subtotal}.00"),
                          SummaryRow(label: "Shipping", value: "EGP ${state.shipping}.00"),
                          SummaryRow(label: "Tax", value: "EGP ${state.tax}.00"),
                          const Divider(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total", style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
                              Text("EGP ${state.total}.00",
                                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold, color: const Color(0xFFD4A056))),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 25.h),

                    // زر Place Order
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: ElevatedButton(
                        onPressed: () => context.read<ReviewOrderCubit>().placeOrder(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFD4A056),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                          elevation: 0,
                        ),
                        child: Text("Place Order", style: TextStyle(color: Colors.white, fontSize: 16.sp, fontWeight: FontWeight.bold)),
                      ),
                    ),

                    SizedBox(height: 12.h),

                    // زر Back to Checkout
                    SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child: OutlinedButton.icon(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back, size: 18, color: Colors.black54),
                        label: Text("Back to Checkout", style: TextStyle(color: Colors.black54, fontSize: 14.sp)),
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.black12),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.h),
                  ],
                ),
              );
            }
            if (state is ReviewOrderError) {
              return Center(child: Text(state.message));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildSubSection(IconData icon, String title, String subtitle) {
    return Row(
      children: [
        Icon(icon, color: Colors.black54, size: 22),
        SizedBox(width: 12.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w600)),
            if (subtitle.isNotEmpty)
              Text(subtitle, style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}