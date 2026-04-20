import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // عشان نقدر نقفل الأب برمجياً لو احتجنا
import 'home_page.dart';
import '../../../product_details/presentation/ui/product_details.dart';

class HomeNavigator extends StatefulWidget {
  const HomeNavigator({super.key});

  @override
  State<HomeNavigator> createState() => _HomeNavigatorState();
}

class _HomeNavigatorState extends State<HomeNavigator> {
  // 1. مفتاح فريد للتحكم في الـ Navigator الداخلي
  final GlobalKey<NavigatorState> _homeNavigatorKey =
      GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      // canPop: false بتخلينا نتحكم إحنا في حركة الرجوع يدوياً
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) return;

        final NavigatorState? navigator = _homeNavigatorKey.currentState;

        // 2. هل الـ Navigator الداخلي فيه صفحات يرجع لها؟ (زي صفحة التفاصيل)
        if (navigator != null && navigator.canPop()) {
          navigator.pop(); // ارجع لصفحة الـ Home وسيب الأب مفتوح
        } else {
          // 3. لو إنت أصلاً في صفحة الـ Home ومفيش حاجة ترجع لها، اقفل التطبيق
          SystemNavigator.pop();
        }
      },
      child: Navigator(
        key: _homeNavigatorKey, // ربط المفتاح بالـ Navigator
        onGenerateRoute: (RouteSettings settings) {
          Widget builder;
          switch (settings.name) {
            case '/':
              builder = HoneyPage();
              break;
            case '/details':
              final int productId = settings.arguments as int;
              builder = ProductDetailsScreen(productId: productId);
              break;
            default:
              builder = HoneyPage();
          }

          return MaterialPageRoute(
            builder: (context) => builder,
            settings: settings,
          );
        },
      ),
    );
  }
}
