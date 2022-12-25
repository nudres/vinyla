import 'package:injectable/injectable.dart';

@singleton
class FirebaseExceptionKeys {
  final firebaseAuthTimeoutFailureKey = "firebase_auth/network-request-failed";
}
