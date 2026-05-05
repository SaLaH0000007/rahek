// ReviewOrderState.dart

abstract class ReviewOrderState {}

class ReviewOrderInitial extends ReviewOrderState {}

class ReviewOrderLoading extends ReviewOrderState {}

class ReviewOrderLoaded extends ReviewOrderState {
  final String subtotal;
  final String shipping;
  final String tax;
  final String total;

  ReviewOrderLoaded({
    required this.subtotal,
    required this.shipping,
    required this.tax,
    required this.total,
  });
}

class ReviewOrderError extends ReviewOrderState {
  final String message;

  ReviewOrderError({required this.message});
}
