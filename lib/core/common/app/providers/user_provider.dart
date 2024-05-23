import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:nexusdeep/core/common/app/providers/user_session.dart';
import 'package:nexusdeep/features/auth/data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserProvider(this._userSession) {
    _loginStateSubscription = _userSession.isLoggedIn.listen((isLoggedIn) {
      if (!isLoggedIn) {
        _user = null;
      } else {
        _user = user;

      }
      notifyListeners();
    });
  }

  LocalUserModel? _user;
  LocalUserModel? get user => _user;
  final UserSession _userSession;
  StreamSubscription<bool>? _loginStateSubscription;

  void initUser(LocalUserModel? user) {
    if (_user != user) {

      _user = user;
      notifyListeners();
    }
  }

  set user(LocalUserModel? user) {
    if (_user != user) {
      _user = user;
      Future.delayed(Duration.zero, notifyListeners);
    }
  }

  @override
  void dispose() {
    _loginStateSubscription?.cancel();
    super.dispose();
  }
}
