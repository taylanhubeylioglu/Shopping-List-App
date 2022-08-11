import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:alisveris_app_homework2/domain/usecases/address/add_address.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '';
import '../../../domain/entities/address.dart';

class UserAddressPresenter extends Presenter {
  late Function addUserAddressOnComplete;
  late Function addUserAddressOnError;

  final AddAddress _addAddress;

  UserAddressPresenter(AddressRepository _addressRepository)
      : _addAddress = AddAddress(_addressRepository);

  void addAddress(Address address) {
    _addAddress.execute(
      _AddUserAddressObserver(this),
      AddAddressParams(address),
    );
  }

  @override
  void dispose() {}
}

class _AddUserAddressObserver extends Observer {
  final UserAddressPresenter _presenter;

  _AddUserAddressObserver(this._presenter);

  @override
  void onComplete() {
    _presenter.addUserAddressOnComplete();
  }

  @override
  void onError(error) {
    _presenter.addUserAddressOnError(error);
  }

  @override
  void onNext(_) {}
}
