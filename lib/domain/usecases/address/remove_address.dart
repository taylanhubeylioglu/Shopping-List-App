import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RemoveAddress extends UseCase<void, RemoveAddressParams> {
  final AddressRepository _addressRepository;

  RemoveAddress(
    this._addressRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(RemoveAddressParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _addressRepository.removeAddress(params!.userId);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class RemoveAddressParams {
  final String userId;
  RemoveAddressParams(this.userId);
}
