import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/bottom_navigation/ui/main_layout_screen.dart';
import '../bloc/register_cubit.dart';
import '../bloc/register_state.dart';
import '../bloc/global_auth_cubit.dart';
import 'login_screen.dart';
import 'widgets/auth_card_layout.dart';
import 'widgets/custom_auth_field.dart';
import 'widgets/auth_action_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(globalAuthCubit: GlobalAuthCubit.get(context)),
      child: Scaffold(
        backgroundColor: AppColors.iconBackground,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainLayoutScreen()),
                (route) => false,
              );
            } else if (state is RegisterFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = RegisterCubit.get(context);

            final bool isValid = state is RegisterFormUpdated
                ? state.isFormValid
                : false;
            final bool isVis = state is RegisterFormUpdated
                ? state.isPasswordVisible
                : false;
            final bool isConfVis = state is RegisterFormUpdated
                ? state.isConfirmPasswordVisible
                : false;
            final bool isLoading = state is RegisterLoading;

            return AuthCardLayout(
              title: "Create Account",
              subtitle: "Join us today and start shopping",
              formContent: Column(
                children: [
                  CustomAuthField(
                    label: "Full Name",
                    hint: "Your Name",
                    prefixIcon: Icons.person_outline,
                    onChanged: cubit.updateName,
                  ),
                  SizedBox(height: AppSizes.p16),
                  CustomAuthField(
                    label: "Email Address",
                    hint: "your@email.com",
                    prefixIcon: Icons.email_outlined,
                    onChanged: cubit.updateEmail,
                  ),
                  SizedBox(height: AppSizes.p16),
                  CustomAuthField(
                    label: "Password",
                    hint: "........",
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isVis,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVis ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: cubit.togglePasswordVisibility,
                    ),
                    onChanged: cubit.updatePassword,
                  ),
                  SizedBox(height: AppSizes.p16),
                  CustomAuthField(
                    label: "Confirm Password",
                    hint: "........",
                    prefixIcon: Icons.lock_outline,
                    obscureText: !isConfVis,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isConfVis ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: cubit.toggleConfirmPasswordVisibility,
                    ),
                    onChanged: cubit.updateConfirmPassword,
                  ),
                  SizedBox(height: AppSizes.p24),
                  AuthActionButton(
                    text: "Create Account",
                    isLoading: isLoading,
                    onPressed: isValid ? cubit.submitRegistration : null,
                  ),
                  SizedBox(height: AppSizes.p16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: AppSizes.f13,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const LoginScreen(),
                          ),
                        ),
                        child: Text(
                          "Sign in",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: AppSizes.f13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              bottomAction:
                  const SizedBox.shrink(), // Empty widget for bottom action on register
            );
          },
        ),
      ),
    );
  }
}
