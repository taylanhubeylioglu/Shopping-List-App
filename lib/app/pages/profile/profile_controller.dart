import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';
import 'profile_presenter.dart';

class ProfileController extends Controller {
  final ProfilePresenter _presenter;

  ProfileController(UserRepository _userRepository)
      : _presenter = ProfilePresenter(_userRepository);

  List<User>? users;

  @override
  void onInitState() {
    _presenter.getUsers();
    super.onInitState();
  }

  @override
  void initListeners() {
    _presenter.getUserOnNext = (List<User>? response) {
      if (response != null) {
        users = response;
      }
      refreshUI();
    };
    _presenter.getUserOnError = (error) {
      print("Get işlemi hatalı");
    };
  }

  @override
  void dispose() {
    _presenter.dispose();
    super.dispose();
  }
}
