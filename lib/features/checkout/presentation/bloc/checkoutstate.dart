class CheckoutState {
  final int shippingIndex;
  final int paymentIndex;

  final String? selectedCountry;
  final String? selectedCity;
  final String? selectedDistrict;

   String? country;

  String? city;
  String? district;
  CheckoutState({
    this.shippingIndex = 0,
    this.paymentIndex = 0,
    this.selectedCountry,
    this.selectedCity,
    this.selectedDistrict,
  });


  CheckoutState copyWith({
    int? shippingIndex,
    int? paymentIndex,
    String? selectedCountry,
    String? selectedCity,
    String? selectedDistrict,
  }) {
    return CheckoutState(
      shippingIndex: shippingIndex ?? this.shippingIndex,
      paymentIndex: paymentIndex ?? this.paymentIndex,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedCity: selectedCity ?? this.selectedCity,
      selectedDistrict: selectedDistrict ?? this.selectedDistrict,
    );
  }
}