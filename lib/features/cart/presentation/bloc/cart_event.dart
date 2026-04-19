import '../../domain/entities/cart_item.dart';

abstract class CartEvent {}

class LoadCart extends CartEvent {}

class AddItemEvent extends CartEvent {
  final CartItem item;
  AddItemEvent(this.item);
}

class UpdateQuantityEvent extends CartEvent {
  final String id;
  final int quantity;
  UpdateQuantityEvent(this.id, this.quantity);
}

class ClearCartEvent extends CartEvent {}