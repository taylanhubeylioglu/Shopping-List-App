import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/address.dart';
import 'user_address_presenter.dart';

class UserAddressController extends Controller {
  final UserAddressPresenter _presenter;

  UserAddressController(AddressRepository _addressRepository)
      : _presenter = UserAddressPresenter(_addressRepository);

  String userAddress = "";
  Address? address;

  List<Address>? _address;

  @override
  void onInitState() {
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.addUserAddressOnComplete = () {
      Navigator.pop(getContext());
      refreshUI();
    };
    _presenter.addUserAddressOnError = (error) {};
  }

  void onContentTextFieldChanged(String value) {
    userAddress = value;
    refreshUI();
  }

  void onAddUserAddressButtonPressed() {
    address = Address(
        Id: DateTime.now().toString(),
        userId: "1",
        userAddress: userAddress,
        date: DateTime.now().toString());

    _presenter.addAddress(address!);
    refreshUI();
  }
}
