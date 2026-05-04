
// logic/order_success_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
part 'order_success_state.dart';

class OrderSuccessCubit extends Cubit<OrderSuccessState> {
  OrderSuccessCubit() : super(OrderSuccessInitial());

  void printOrder() {
    // Logic للطباعة
  }
}