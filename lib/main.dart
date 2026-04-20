import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_colors_light.dart';
import 'core/widgets/bottom_navigation/bloc/bottom_navigation_cubit.dart';
import 'features/cart/presentation/bloc/cart_cubit.dart';
import 'features/home/presentation/bloc/home_cubit.dart';
import 'features/product_details/presentation/bloc/product_details_cubit.dart';
import 'core/widgets/bottom_navigation/ui/main_layout_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const RahekApp());
}

class RahekApp extends StatelessWidget {
  const RahekApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ProductDetailsCubit()),
        BlocProvider(create: (context) => CartCubit()..loadCart()),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => BottomNavigationCubit()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812), // مقاس التصميم المبدئي (Figma)
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Rahek',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: AppColors.background,
              primaryColor: AppColors.primary,
              colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
            ),
            home: MainLayoutScreen(),
          );
        },
      ),
    );
  }
}
