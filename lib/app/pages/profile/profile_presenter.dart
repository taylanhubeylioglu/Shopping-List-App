import 'package:alisveris_app_homework2/domain/repositories/user_repository.dart';
import 'package:alisveris_app_homework2/domain/usecases/user/get_user.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/user.dart';

class ProfilePresenter extends Presenter {
  late Function getUserOnNext;
  late Function getUserOnError;

  final GetUser _getUser;

  ProfilePresenter(UserRepository _userRepository)
      : _getUser = GetUser(_userRepository);

  @override
  void dispose() {
    _getUser.dispose();
  }

  void getUsers() {
    _getUser.execute(_GetUsersObserver(this));
  }
}

class _GetUsersObserver extends Observer<List<User>> {
  final ProfilePresenter _presenter;
  _GetUsersObserver(this._presenter);

  @override
  void onComplete() {}

  @override
  void onError(error) {
    _presenter.getUserOnError(error);
  }

  @override
  void onNext(List<User>? response) {
    _presenter.getUserOnNext(response);
  }
}
