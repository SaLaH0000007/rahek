import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/checkout_stepper.dart';
import '../../../../core/widgets/checkout_widgets.dart' hide AppDropdown;
import '../../../../core/widgets/checkoutstate.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/widgets/app_dropdown.dart';
import '../bloc/checkout_cubit.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final countries = ["Egypt", "Saudi Arabia", "UAE"];
    final cities = ["Cairo", "Giza", "Alex"];
    final districts = ["District 1", "District 2"];

    return BlocProvider(
      create: (_) => CheckoutCubit(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: CustomAppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
          child: SingleChildScrollView(
            child: BlocBuilder<CheckoutCubit, CheckoutState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.height * 0.02),
                    const CheckoutStepper(currentStep: 1),
                    SizedBox(height: size.height * 0.02),
                    Row(
                      children: const [
                        Expanded(child: AppTextField(hint: "First Name")),
                        SizedBox(width: AppSizes.p12),
                        Expanded(child: AppTextField(hint: "Last Name")),
                      ],
                    ),
                    const SizedBox(height: AppSizes.p12),
                    AppDropdown(
                      hint: "Country",
                      items: countries,
                      value: state.country,
                      onChanged: (val) {
                        if (val != null) {
                          context.read<CheckoutCubit>().changeCountry(val);
                        }
                      },
                    ),
                    const SizedBox(height: AppSizes.p12),
                    const AppTextField(hint: "Address"),
                    const SizedBox(height: AppSizes.p12),
                    Row(
                      children: const [
                        Expanded(child: AppTextField(hint: "Phone")),
                        SizedBox(width: AppSizes.p12),
                        Expanded(child: AppTextField(hint: "Email")),
                      ],
                    ),
                    const SizedBox(height: AppSizes.p12),
                    Row(
                      children: [
                        Expanded(
                          child: AppDropdown(
                            hint: "City",
                            items: cities,
                            value: state.city,
                            onChanged: (val) {
                              if (val != null) {
                                context.read<CheckoutCubit>().changeCity(val);
                              }
                            },
                          ),
                        ),
                        const SizedBox(width: AppSizes.p12),
                        Expanded(
                          child: AppDropdown(
                            hint: "District",
                            items: districts,
                            value: state.district,
                            onChanged: (val) {
                              if (val != null) {
                                context
                                    .read<CheckoutCubit>()
                                    .changeDistrict(val);
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSizes.p12),
                    const AppTextField(hint: "Postal Code (optional)"),
                    const SizedBox(height: AppSizes.p12),
                    const AppTextField(
                      hint: "Order notes (optional)",
                      maxLines: 3,
                    ),
                    const SizedBox(height: AppSizes.p24),
                    const Text(
                      "YOUR ORDER",
                      style: TextStyle(
                        fontSize: AppSizes.f14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSizes.p12),
                    Container(
                      padding: const EdgeInsets.all(AppSizes.p16),
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.border),
                        borderRadius: BorderRadius.circular(AppSizes.r12),
                      ),
                      child: Column(
                        children: [
                          const PriceRow(
                            title: "Product",
                            value: "EGP 175.00",
                          ),
                          const SizedBox(height: AppSizes.p8),
                          const PriceRow(
                            title: "Subtotal",
                            value: "EGP 175.00",
                            bold: true,
                          ),
                          const Divider(),
                          Row(
                            children: [
                              Radio(
                                value:0,
                                groupValue: state.shippingIndex,
                                onChanged: (v) {
                                  context
                                      .read<CheckoutCubit>()
                                      .changeShipping(v!);
                                },
                              ),
                              const Text("Flat rate"),
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                value: 1,
                                groupValue: state.shippingIndex,
                                onChanged: (v) {
                                  context
                                      .read<CheckoutCubit>()
                                      .changeShipping(v!);
                                },
                              ),
                              const Text("Free shipping"),
                            ],
                          ),
                          const Divider(),
                          const PriceRow(
                            title: "Total",
                            value: "EGP 185.00",
                            bold: true,
                          ),
                          const SizedBox(height: AppSizes.p12),
                          Row(
                            children: [
                              Radio(
                                value: 0,
                                groupValue: state.paymentIndex,
                                onChanged: (v) {
                                  context
                                      .read<CheckoutCubit>()
                                      .changePayment(v!);
                                },
                              ),
                              const Text("Cash on delivery"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      width: double.infinity,
                      height: AppSizes.buttonHeight,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppSizes.r12),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text("Continue"),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
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