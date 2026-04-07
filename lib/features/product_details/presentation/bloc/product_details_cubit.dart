import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rahek/features/product_details/presentation/bloc/product_details_state.dart';

class ProductNumberCubit extends Cubit<ProductNumberState> {
  ProductNumberCubit() : super(ProductNumberInitialState());
  int counter = 1;

  static ProductNumberCubit get(context) => BlocProvider.of(context);

  void increment() {
    counter++;
    emit(ProductNumberIncrementState(counter));
  }

  void decrement() {
    if (counter > 1) {
      counter--;
      emit(ProductNumberDecrementState(counter));
    }
  }
}
