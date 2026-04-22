import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/widgets/bottom_navigation/ui/main_layout_screen.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_state.dart';
import '../bloc/global_auth_cubit.dart';
import 'register_screen.dart';
import 'widgets/auth_card_layout.dart';
import 'widgets/custom_auth_field.dart';
import 'widgets/auth_action_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(globalAuthCubit: GlobalAuthCubit.get(context)),
      child: Scaffold(
        backgroundColor: AppColors.iconBackground,
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => MainLayoutScreen()),
                (route) => false,
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: AppColors.error,
                ),
              );
            }
          },
          builder: (context, state) {
            final cubit = LoginCubit.get(context);

            final bool isValid = state is LoginFormUpdated
                ? state.isFormValid
                : false;
            final bool isVisible = state is LoginFormUpdated
                ? state.isPasswordVisible
                : false;
            final bool rememberMe = state is LoginFormUpdated
                ? state.rememberMe
                : false;
            final bool isLoading = state is LoginLoading;

            return AuthCardLayout(
              title: "Welcome Back",
              subtitle: "Sign in to continue to your account",
              formContent: Column(
                children: [
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
                    obscureText: !isVisible,
                    suffixIcon: IconButton(
                      icon: Icon(
                        isVisible ? Icons.visibility : Icons.visibility_off,
                        color: AppColors.textSecondary,
                      ),
                      onPressed: cubit.togglePasswordVisibility,
                    ),
                    onChanged: cubit.updatePassword,
                  ),
                  SizedBox(height: AppSizes.p8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: AppSizes.s32,
                            height: AppSizes.s32,
                            child: Checkbox(
                              value: rememberMe,
                              onChanged: cubit.toggleRememberMe,
                              activeColor: AppColors.primary,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                          Text(
                            "Remember me",
                            style: TextStyle(
                              fontSize: AppSizes.f13,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(
                            fontSize: AppSizes.f13,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.p16),
                  AuthActionButton(
                    text: "Sign in",
                    isLoading: isLoading,
                    onPressed: isValid ? cubit.submitLogin : null,
                  ),
                  SizedBox(height: AppSizes.p16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontSize: AppSizes.f13,
                        ),
                      ),
                      TextButton(
                        onPressed: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RegisterScreen(),
                          ),
                        ),
                        child: Text(
                          "Sign up",
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
              bottomAction: Text(
                "By signing in, you agree to our Terms of\nService and Privacy Policy",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.textSecondary,
                  fontSize: AppSizes.f12,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
