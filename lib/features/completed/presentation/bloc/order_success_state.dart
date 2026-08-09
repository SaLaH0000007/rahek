// logic/order_success_state.dart
part of 'order_success_cubit.dart';

abstract class OrderSuccessState {}

// الحالة الابتدائية
class OrderSuccessInitial extends OrderSuccessState {}

// حالة التحميل (لو بتجيب بيانات الطلب من الـ API مثلاً)
class OrderSuccessLoading extends OrderSuccessState {}

// حالة النجاح ومعاها البيانات (Data Model)
class OrderSuccessLoaded extends OrderSuccessState {
  // هنا ممكن نمرر موديل الطلب لو حابين نعرض بيانات ديناميكية
  // final OrderModel order;
  // OrderSuccessLoaded(this.order);
}

// حالة الخطأ
class OrderSuccessError extends OrderSuccessState {
  final String message;
  OrderSuccessError(this.message);
}