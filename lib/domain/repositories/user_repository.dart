import '../entities/user.dart';

abstract class UserRepository {
  Stream<List<User>> get users;
  Future<void> addUser(User users);
  Future<void> removeUser(String userId);
}
