import 'package:flutter/material.dart';
import '../../../../core/shared/list.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../../../../core/theme/app_colors_light.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../cart/presentation/bloc/cart_cubit.dart';
import '../../../product_details/data/models/product.dart';
import '../../../product_details/presentation/ui/product_details.dart';

class HoneyPage extends StatelessWidget {
  HoneyPage({super.key});

  final List<String> imageList = [
    "assets/images/Container1.png",
    "assets/images/Container2.png",
    "assets/images/Container2.png",
    "assets/images/Container1.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Banner
            Container(
              height: 150.0,
              width: double.infinity,
              margin: const EdgeInsets.all(AppSizes.p12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.r12),
                image: const DecorationImage(
                  image: AssetImage("assets/images/img.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Offers
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Container1.png",
                  height: AppSizes.s60,
                ),
                const SizedBox(width: AppSizes.p12),
                Image.asset(
                  "assets/images/Container2.png",
                  height: AppSizes.s60,
                ),
              ],
            ),

            const SizedBox(height: AppSizes.p12),

            // Title
            const Text(
              "New Products",
              style: TextStyle(
                fontSize: AppSizes.f18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimary,
              ),
            ),

            const SizedBox(height: AppSizes.p8),

            // Filters
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                filterButton("New Products"),
                const SizedBox(width: AppSizes.p8),
                filterButton("Final Sale"),
                const SizedBox(width: AppSizes.p8),
                filterButton("Top Sales"),
              ],
            ),

            const SizedBox(height: AppSizes.p12),

            // Products Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: products.length,
              padding: const EdgeInsets.all(AppSizes.p12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.55,
                crossAxisSpacing: AppSizes.p12,
                mainAxisSpacing: AppSizes.p12,
              ),
              itemBuilder: (context, index) {
                final product = products[index];
                return _buildProductCard(context, product);
              },
            ),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: imageList.length,
              padding: const EdgeInsets.all(AppSizes.p12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: AppSizes.p12,
                mainAxisSpacing: AppSizes.p12,
                childAspectRatio: 1.3,
              ),
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(AppSizes.r12),
                  child: Image.asset(
                    imageList[index],
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Filter Button
  Widget filterButton(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.p12,
        vertical: AppSizes.p8,
      ),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(AppSizes.r16),
        border: Border.all(color: AppColors.primary),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: AppSizes.f12,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  // Product Card

  Widget _buildProductCard(BuildContext context, Product product) {
    return GestureDetector(
      onTap: () {
        // الانتقال لصفحة التفاصيل مع تمرير الـ id الحقيقي بتاع المنتج
        Navigator.of(context).pushNamed('/details', arguments: product.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(AppSizes.r8),
          border: Border.all(color: AppColors.border),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // الجزء العلوي: الصورة والأيقونات
            Expanded(
              child: Stack(
                children: [
                  // 👈 صورة المنتج الحقيقية من اللستة
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(AppSizes.p16),
                      child: Image.asset(product.image, fit: BoxFit.contain),
                    ),
                  ),
                  // الأيقونات اللي على اليمين فوق
                  Positioned(
                    top: AppSizes.p8,
                    right: AppSizes.p8,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.swap_horiz,
                          color: AppColors.textSecondary,
                          size: AppSizes.icon20,
                        ),
                        SizedBox(height: AppSizes.p12),
                        Icon(
                          Icons
                              .favorite_border, // خليتها بوردر عشان تكون زي الصورة
                          color: AppColors.textSecondary,
                          size: AppSizes.icon20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // التقييم
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) => Icon(
                  // 👈 منطق بسيط لعرض النجوم المليانة والفاضية بناءً على التقييم
                  index < product.rating.floor()
                      ? Icons.star
                      : Icons.star_border,
                  color: AppColors.primary,
                  size: AppSizes.iconSmall,
                ),
              ),
            ),
            const SizedBox(height: AppSizes.p8),

            // الأسعار والخصم
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSizes.p12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 👈 السعر الحقيقي
                  Text(
                    "EGP ${product.price.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                      fontSize: AppSizes.f16,
                    ),
                  ),
                  const SizedBox(height: AppSizes.p2),
                  // (سعر وهمي قبل الخصم - لأن الموديل بتاعك مفيهوش السعر القديم)
                  Text(
                    "EGP ${(product.price + 30).toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: AppColors.textSecondary,
                      decoration: TextDecoration.lineThrough,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                  const SizedBox(height: AppSizes.p2),
                  const Text(
                    "20% off", // (نسبة وهمية برضه لنفس السبب)
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                      fontSize: AppSizes.f12,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSizes.p12),

            // 👈 زر إضافة للسلة المربوط بالـ Cubit
            InkWell(
              onTap: () {
                // 1. تحديد الوزن الافتراضي (أول وزن في اللستة أو 0 لو مفيش أوزان)
                final int defaultWeight =
                    (product.weight != null && product.weight!.isNotEmpty)
                    ? product.weight!.first
                    : 0;

                // 2. استدعاء دالة الإضافة من الـ CartCubit
                CartCubit.get(context).addToCart(
                  product: product,
                  quantity: 1, // الكمية الافتراضية 1 من الصفحة الرئيسية
                  selectedWeight: defaultWeight,
                );

                // 3. إظهار رسالة للمستخدم إن المنتج اتضاف بنجاح
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} added to cart!'),
                    backgroundColor: AppColors.success, // لون أخضر أو برتقالي
                    duration: const Duration(seconds: 2),
                  ),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSizes.p12),
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(AppSizes.r8),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.shopping_cart,
                      color: AppColors.background,
                      size: AppSizes.iconSmall,
                    ),
                    SizedBox(width: AppSizes.p8),
                    Text(
                      "Add to cart",
                      style: TextStyle(
                        color: AppColors.background,
                        fontWeight: FontWeight.bold,
                        fontSize: AppSizes.f13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
