import 'package:alisveris_app_homework2/domain/entities/address.dart';
import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:alisveris_app_homework2/domain/usecases/address/get_address.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/repositories/cart_repository.dart';
import '../../../domain/usecases/cart/get_cart.dart';

class HomePresenter extends Presenter {
  late Function getCartOnNext;
  late Function getCartOnError;
  late Function getAddressOnNext;
  late Function getAddressOnError;

  final GetCart _getCart;
  final GetAddress _getAddress;

  HomePresenter(
      CartRepository _cartRepository, AddressRepository _addressRepository)
      : _getCart = GetCart(_cartRepository),
        _getAddress = GetAddress(_addressRepository);

  @override
  void dispose() {
    _getCart.dispose();
    _getAddress.dispose();
  }

  void getCart() {
    _getCart.execute(_GetCartObserver(this));
  }

  void getAddress() {
    _getAddress.execute(_GetAddressObserver(this));
  }
}

class _GetCartObserver extends Observer<List<Cart>> {
  final HomePresenter _presenter;

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

class _GetAddressObserver extends Observer<List<Address>> {
  final HomePresenter _presenter;
  _GetAddressObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getAddressOnError(error);
  }

  @override
  void onNext(List<Address>? response) {
    _presenter.getAddressOnNext(response);
  }
}
