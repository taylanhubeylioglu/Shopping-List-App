import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/address.dart';

class AddAddress extends UseCase<void, AddAddressParams> {
  final AddressRepository _addressRepository;

  AddAddress(
    this._addressRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(AddAddressParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _addressRepository.addAddress(params!.address);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class AddAddressParams {
  final Address address;
  AddAddressParams(this.address);
}
