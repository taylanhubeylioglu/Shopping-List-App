import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/cart.dart';

class GetCart extends UseCase<List<Cart>, void> {
  final CartRepository _addressRepository;
  final StreamController<List<Cart>> _controller;

  GetCart(this._addressRepository) : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<Cart>?>> buildUseCaseStream(void params) async {
    try {
      _addressRepository.carts.listen((List<Cart> cart) {
        if (!_controller.isClosed) _controller.add(cart);
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
