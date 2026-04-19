import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/cart_repository.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository repository;

  CartBloc(this.repository) : super(CartState([])) {
    on<LoadCart>((event, emit) {
      emit(CartState(repository.getCartItems()));
    });

    on<AddItemEvent>((event, emit) {
      repository.addItem(event.item);
      emit(CartState(repository.getCartItems()));
    });

    on<UpdateQuantityEvent>((event, emit) {
      repository.updateQuantity(event.id, event.quantity);
      emit(CartState(repository.getCartItems()));
    });

    on<ClearCartEvent>((event, emit) {
      repository.clearCart();
      emit(CartState([]));
    });
  }
}