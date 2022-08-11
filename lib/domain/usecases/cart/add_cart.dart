import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/cart.dart';

class AddCart extends UseCase<void, AddCartParams> {
  final CartRepository _cartRepository;

  AddCart(this._cartRepository);

  @override
  Future<Stream<void>> buildUseCaseStream(AddCartParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _cartRepository.addCart(params!.cart);
      controller.close();
    } catch (error, stacktrace) {
      print(error);
      print(stacktrace);
      controller.addError(error, stacktrace);
    }
    return controller.stream;
  }
}

class AddCartParams {
  final Cart cart;
  AddCartParams(this.cart);
}
