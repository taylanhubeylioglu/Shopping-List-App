import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/usecases/cart/get_cart.dart';

class CartPresenter extends Presenter {
  late Function getCartOnNext;
  late Function getCartOnError;

  final GetCart _getCart;

  CartPresenter(CartRepository _cartRepository)
      : _getCart = GetCart(_cartRepository);

  @override
  void dispose() {
    _getCart.dispose();
  }

  void getCart() {
    _getCart.execute(_GetCartObserver(this));
  }
}

class _GetCartObserver extends Observer<List<Cart>> {
  final CartPresenter _presenter;

  _GetCartObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getCartOnError(error);
  }

  @override
  void onNext(List<Cart>? response) {
    _presenter.getCartOnNext(response);
  }
}
