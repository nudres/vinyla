import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'injection.config.dart';

@InjectableInit()
Future<GetIt> configureDependencies({String environment = Environment.dev}) async {
  final di = GetIt.asNewInstance();
  $initGetIt(di, environment: environment);
  return di;
}

@module
abstract class RegisterModule {
  @Singleton()
  FirebaseFirestore database() => FirebaseFirestore.instance;

  @Singleton()
  FirebaseAuth auth() => FirebaseAuth.instance;

  @Singleton()
  FirebaseMessaging messaging() => FirebaseMessaging.instance;
}
