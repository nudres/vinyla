import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../config/http_config.dart';

@singleton
class FirebaseAuthDatasource {
  const FirebaseAuthDatasource(
    this._firebaseAuth,
    this._config,
  );

  final FirebaseAuth _firebaseAuth;
  final HttpConfig _config;

  Future<User> login(String emailAddress, String password) async {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .timeout(
          _config.requestTimeout,
          onTimeout: () => throw TimeoutException("Can't connect in ${_config.requestTimeout.inSeconds} seconds."),
        )
        .then((value) => value.user!);
  }
}
