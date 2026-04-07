abstract class ProductNumberState {}

class ProductNumberInitialState extends ProductNumberState {}

class ProductNumberIncrementState extends ProductNumberState {
  final int counter;
  ProductNumberIncrementState(this.counter);
}

class ProductNumberDecrementState extends ProductNumberState {
  final int counter;
  ProductNumberDecrementState(this.counter);
}
