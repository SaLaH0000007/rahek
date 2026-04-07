import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/theme/app_colors_light.dart';
import 'features/home/presentation/bloc/bottom_navigation_cubit.dart';
import 'features/product_details/presentation/bloc/product_details_cubit.dart';
import 'features/home/presentation/ui/screens/main_layout_screen.dart';

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
        // توفير الـ Cubit على مستوى التطبيق (أو الشاشة حسب احتياجك)
        BlocProvider(create: (context) => ProductNumberCubit()),
        BlocProvider(create: (context) => BottomNavigationCubit()),
      ],
      child: MaterialApp(
        title: 'Rahek',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: AppColors.background,
          primaryColor: AppColors.primary,
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        ),
        // البداية هتكون من شاشة الـ Layout اللي فيها الـ Bottom Nav
        home: MainLayoutScreen(),
      ),
    );
  }
}
