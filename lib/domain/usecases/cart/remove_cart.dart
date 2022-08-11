import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/cart_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RemoveCart extends UseCase<void, RemoveCartParams> {
  final CartRepository _cartRepository;

  RemoveCart(
    this._cartRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(RemoveCartParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _cartRepository.removeCart(params!.userId);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class RemoveCartParams {
  final String userId;
  RemoveCartParams(this.userId);
}
