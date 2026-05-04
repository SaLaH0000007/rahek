// review_order_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ReviewOrderState.dart';

class ReviewOrderCubit extends Cubit<ReviewOrderState> {
  ReviewOrderCubit() : super(ReviewOrderInitial());

  void getOrderDetails() async {
    emit(ReviewOrderLoading());
    await Future.delayed(const Duration(seconds: 1)); // محاكاة API
    emit(ReviewOrderLoaded(
      subtotal: "25.00",
      shipping: "10.00",
      tax: "0.00",
      total: "35.00",
    ));
  }

  void placeOrder() {
    // Logic تنفيذ الطلب
  }
}