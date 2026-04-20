import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppSizes {
  // ZERO
  static const double O = 0.0; // الصفر لا يحتاج لتجاوب

  // Padding & Margin (p)
  // نستخدم .w لتتجاوب المسافات مع عرض الشاشة
  static double get p2 => 2.0.w;
  static double get p4 => 4.0.w;
  static double get p8 => 8.0.w;
  static double get p12 => 12.0.w;
  static double get p14 => 14.0.w;
  static double get p16 => 16.0.w;
  static double get p24 => 24.0.w;
  static double get p32 => 32.0.w;
  static double get p35 => 35.0.w;

  // Font Sizes (f)
  // نستخدم .sp لتتجاوب الخطوط مع إعدادات حجم الخط في الموبايل نفسه
  static double get f11 => 11.0.sp;
  static double get f12 => 12.0.sp;
  static double get f13 => 13.0.sp;
  static double get f14 => 14.0.sp;
  static double get f16 => 16.0.sp;
  static double get f18 => 18.0.sp;
  static double get f20 => 20.0.sp;
  static double get f22 => 22.0.sp;

  // Border Radius (r)
  // نستخدم .r ليكون الانحناء متناسقاً
  static double get r4 => 4.0.r;
  static double get r8 => 8.0.r;
  static double get r12 => 12.0.r;
  static double get r16 => 16.0.r;

  // Specific Widget Sizes
  static double get galleryHeight => 300.0.h; // .h للارتفاع
  static double get thumbnailSize => 60.0.w;
  static double get bottomNavigationBarHeight => 65.0.h;

  // Custom Sizes (s) للصور والعناصر المخصصة
  static double get s32 => 32.0.w;
  static double get s60 => 60.0.w;
  static double get s80 => 80.0.w;

  // Icons Sizes
  static double get icon14 => 14.0.sp;
  static double get iconSmall => 16.0.sp;
  static double get icon20 => 20.0.sp;
  static double get iconMedium => 24.0.sp;
  static double get iconLarge => 28.0.sp;

  // Buttons & Banners
  static double get buttonHeight => 48.0.h;
  static double get promoBannerHeight => 100.0.h;
}
