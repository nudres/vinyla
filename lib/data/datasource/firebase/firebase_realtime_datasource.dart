import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseRealtimeDatasource {
  const FirebaseRealtimeDatasource(this._database);

  final FirebaseFirestore _database;

  Future<Map<String, dynamic>> get(String path) async {
    final reference = await _database.doc(path).get();
    return reference.data()!;
  }
}
