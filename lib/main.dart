// main.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/completed/presentation/ui/order_success_page.dart';
import 'features/orders/presentation/ui/review_order_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // تأكد من المقاس الصحيح للتصميم
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child, // هذا يضمن أن الصفحة لن تترسم إلا بعد جاهزية ScreenUtil
        );
      },
      child: const OrderSuccessPage(),
    );
  }
}