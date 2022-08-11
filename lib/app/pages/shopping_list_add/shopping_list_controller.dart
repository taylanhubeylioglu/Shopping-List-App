import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/repositories/cart_repository.dart';
import 'shopping_list_presenter.dart';

class ShoppingListController extends Controller {
  final ShoppingListPresenter _presenter;

  ShoppingListController(CartRepository _cartRepository)
      : _presenter = ShoppingListPresenter(_cartRepository);

  String content = "";
  Cart? cart;

  List<Cart>? carts;

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.addShoppingListOnComplate = () {
      Navigator.pop(getContext());
      refreshUI();
    };
    _presenter.addShoppingListOnError = (e) {};
  }

  void onContentTextFieldChanged(String value) {
    content = value;
    refreshUI();
  }

  void onAddUserCartButtonPressed() {
    cart = Cart(
      id: DateTime.now().toString(),
      userId: "1",
      content: content,
      date: DateTime.now().toString(),
    );

    _presenter.addCart(cart!);
    refreshUI();
  }
}
