import 'dart:async';

import 'package:alisveris_app_homework2/domain/entities/user.dart';
import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';

class DataUserRepository implements UserRepository {
  static final _instance = DataUserRepository._internal();
  DataUserRepository._internal();

  factory DataUserRepository() => _instance;

  bool isUserFetched = false;

  final List<User> _userList = [
    User(id: "1", firstName: "Taylan", lastName: "Hubeylioğlu")
  ];

  StreamController<List<User>> _streamController = StreamController.broadcast();

  void _initUser() {
    try {
      _streamController.add(_userList);
      isUserFetched = true;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Future<void> addUser(User users) async {
    _userList.add(users);
    _streamController.add(_userList);
  }

  @override
  Future<void> removeUser(String userId) async {
    try {
      _userList.remove(_userList.firstWhere((element) => element.id == userId));
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }

  @override
  Stream<List<User>> get users {
    try {
      if (!isUserFetched) _initUser();
      Future.delayed(Duration.zero)
          .then((value) => _streamController.add(_userList));
      return _streamController.stream;
    } catch (error, stackTrace) {
      print(error);
      print(stackTrace);
      rethrow;
    }
  }
}
