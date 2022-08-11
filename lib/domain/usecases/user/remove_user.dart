import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';
import 'package:alisveris_app_homework2/domain/usecases/cart/remove_cart.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class RemoveUser extends UseCase<void, RemoveCartParams> {
  final UserRepository _userRepository;

  RemoveUser(
    this._userRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(RemoveCartParams? params) async {
    StreamController<void> controller = StreamController();

    try {
      await _userRepository.removeUser(params!.userId);
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
