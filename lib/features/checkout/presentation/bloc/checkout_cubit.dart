import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/widgets/checkoutstate.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutState());

  void changeShipping(int value) {
    emit(state.copyWith(shippingIndex: value));
  }

  void changePayment(int value) {
    emit(state.copyWith(paymentIndex: value));
  }

  void changeCountry(String value) {
    emit(state.copyWith(selectedCountry: value));
  }

  void changeCity(String value) {
    emit(state.copyWith(selectedCity: value));
  }

  void changeDistrict(String value) {
    emit(state.copyWith(selectedDistrict: value));
  }
}