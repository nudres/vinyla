import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseFCMDatasource {
  const FirebaseFCMDatasource(
    this._fcm,
  );

  final FirebaseMessaging _fcm;

  Future<String?> token() => _fcm.getToken();
}
