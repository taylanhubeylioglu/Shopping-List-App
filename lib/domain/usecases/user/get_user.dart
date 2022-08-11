import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/user.dart';

class GetUser extends UseCase<List<User>, void> {
  final UserRepository _userRepository;
  final StreamController<List<User>> _controller;

  GetUser(this._userRepository) : _controller = StreamController.broadcast();

  @override
  Future<Stream<List<User>?>> buildUseCaseStream(void params) async {
    try {
      _userRepository.users.listen((List<User> user) {
        if (!_controller.isClosed) _controller.add(user);
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
