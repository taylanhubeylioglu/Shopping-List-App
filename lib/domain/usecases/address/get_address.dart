import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/address_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/address.dart';

class GetAddress extends UseCase<List<Address>, void> {
  final AddressRepository _addressRepository;
  final StreamController<List<Address>> _controller;

  GetAddress(this._addressRepository)
      : _controller = StreamController.broadcast();
  @override
  Future<Stream<List<Address>?>> buildUseCaseStream(void params) async {
    try {
      _addressRepository.address.listen((List<Address> notebooks) {
        if (!_controller.isClosed) _controller.add(notebooks);
      });
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      _controller.addError(error, stackTrace);
    }
    return _controller.stream;
  }

  @override
  void dispose() {
    _controller.close();
    super.dispose();
  }
}
