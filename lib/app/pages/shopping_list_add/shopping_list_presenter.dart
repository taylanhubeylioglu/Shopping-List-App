import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/usecases/cart/add_cart.dart';

class ShoppingListPresenter extends Presenter {
  late Function addShoppingListOnComplate;
  late Function addShoppingListOnError;

  final AddCart _addCart;

  ShoppingListPresenter(CartRepository _cartRepository)
      : _addCart = AddCart(_cartRepository);

  void addCart(Cart cart) {
    _addCart.execute(
      _AddCartObserver(this),
      AddCartParams(cart),
    );
  }

  @override
  void dispose() {
    _addCart.dispose();
  }
}

class _AddCartObserver extends Observer {
  final ShoppingListPresenter _presenter;

  _AddCartObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.addShoppingListOnComplate();
  }

  @override
  void onError(e) {
    _presenter.addShoppingListOnError(e);
  }

  @override
  void onNext(_) {}
}
