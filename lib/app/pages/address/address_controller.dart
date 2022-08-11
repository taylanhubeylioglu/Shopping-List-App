import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/address.dart';
import 'address_presenter.dart';

class AddressController extends Controller {
  final AddressPresenter _presenter;

  AddressController(AddressRepository _addressRepository)
      : _presenter = AddressPresenter(_addressRepository);

  List<Address>? address;

  @override
  void onInitState() {
    _presenter.getAddress();
    super.onInitState();
  }

  @override
  void initListeners() {
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
