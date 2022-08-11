import 'package:alisveris_app_homework2/app/pages/home/home_presenter.dart';
import 'package:alisveris_app_homework2/domain/entities/address.dart';
import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cart.dart';
import '../../../domain/repositories/cart_repository.dart';

class HomeController extends Controller {
  final HomePresenter _presenter;

  HomeController(
      CartRepository _cartRepository, AddressRepository _addressRepository)
      : _presenter = HomePresenter(_cartRepository, _addressRepository);

  List<Cart>? carts;
  List<Address>? address;

  @override
  void onInitState() {
    _presenter.getCart();
    _presenter.getAddress();
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

    _presenter.getAddressOnNext = (List<Address>? response) {
      if (response != null) {
        address = response;
      }
      refreshUI();
    };
    _presenter.getAddressOnError = (error) {
      print("Get işlemi hatalı");
    };
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
