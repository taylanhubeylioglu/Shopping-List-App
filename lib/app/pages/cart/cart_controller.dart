import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import 'cart_presenter.dart';

class CartController extends Controller {
  final CartPresenter _presenter;

  CartController(CartRepository _cartRepository)
      : _presenter = CartPresenter(_cartRepository);

  List<Cart>? carts;

  @override
  void onInitState() {
    _presenter.getCart();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getCartOnNext = (List<Cart>? response) {
      if (response != null) {
        carts = response;
      }
      refreshUI();
    };

    _presenter.getCartOnError = (error) {
      print("Get işlemi hatalı");
    };
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
