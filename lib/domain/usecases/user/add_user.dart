import 'dart:async';

import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../entities/user.dart';

class AddUser extends UseCase<void, AddUserParams> {
  final UserRepository _userRepository;

  AddUser(
    this._userRepository,
  );

  @override
  Future<Stream<void>> buildUseCaseStream(AddUserParams? params) async {
    StreamController<void> controller = StreamController();
    try {
      await _userRepository.addUser(params!.users);
      controller.close();
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      controller.addError(error, stackTrace);
    }
    return controller.stream;
  }
}

class AddUserParams {
  final User users;
  AddUserParams(this.users);
}
