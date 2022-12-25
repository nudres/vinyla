import 'dart:async';
import 'dart:developer';

import 'package:flutter/foundation.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import 'package:vinyla/data/data.dart';

import '../config/http_config.dart';

@singleton
class FirebaseAuthDatasource {
  const FirebaseAuthDatasource(
    this._firebaseAuth,
    this._config,
  );

  final FirebaseAuth _firebaseAuth;
  final HttpConfig _config;

  Future<UserDTO> login(String emailAddress, String password) async {
    return _firebaseAuth
        .signInWithEmailAndPassword(email: emailAddress, password: password)
        .timeout(_config.requestTimeout,
            onTimeout: () => throw TimeoutException("Can't connect in ${_config.requestTimeout.inSeconds} seconds."))
        .then((value) => _mapFirebaseUserToDTO(value.user!));
  }

  Future<PhoneVerifierDTO> loginByPhone(
    String phone,
  ) async {
    final Completer<PhoneVerifierDTO> completer = Completer();
    _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async {
        final user = (await _firebaseAuth.signInWithCredential(phoneAuthCredential)).user!;
        completer.complete(PhoneVerifierDTO(user: _mapFirebaseUserToDTO(user)));
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        completer.complete(PhoneVerifierDTO(verifyId: verificationId));
      },
      verificationFailed: (FirebaseAuthException error) {
        completer.completeError(error);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (kDebugMode) {
          log("Code auto retrieval timeout: VerificationId: ${verificationId.toString()}");
        }
      },
    );
    return completer.future;
  }

  Future<UserDTO> verifyPhone(
    String verificationId,
    String code,
  ) async {
    return _firebaseAuth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId, smsCode: code))
        .timeout(_config.requestTimeout,
            onTimeout: () => throw TimeoutException("Can't connect in ${_config.requestTimeout.inSeconds} seconds."))
        .then((value) => _mapFirebaseUserToDTO(value.user!));
  }

  Future<UserDTO?> user() async {
    return _firebaseAuth.currentUser == null ? null : _mapFirebaseUserToDTO(_firebaseAuth.currentUser!);
  }

  UserDTO _mapFirebaseUserToDTO(User user) {
    return UserDTO(
      uuid: user.uid,
      email: user.email,
      phone: user.phoneNumber,
      dateOfCreation: user.metadata.creationTime,
      dateOfLastVisit: user.metadata.lastSignInTime,
    );
  }
}
