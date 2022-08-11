import 'package:alisveris_app_homework2/domain/entities/address.dart';
import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:alisveris_app_homework2/domain/usecases/address/get_address.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AddressPresenter extends Presenter {
  late Function getAddressOnNext;
  late Function getAddressOnError;

  final GetAddress _getAddress;

  AddressPresenter(AddressRepository _addressRepository)
      : _getAddress = GetAddress(_addressRepository);

  @override
  void dispose() {
    _getAddress.dispose();
  }

  void getAddress() {
    _getAddress.execute(_GetAddressObserver(this));
  }
}

class _GetAddressObserver extends Observer<List<Address>> {
  final AddressPresenter _presenter;

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
