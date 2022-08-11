import '../entities/cart.dart';

abstract class CartRepository {
  Stream<List<Cart>> get carts;
  Future<void> addCart(Cart cart);
  Future<void> removeCart(String userId);
}
