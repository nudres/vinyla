import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@singleton
class FirebaseDatabaseDatasource {
  const FirebaseDatabaseDatasource(this._database);

  final FirebaseFirestore _database;

  Future<Map<String, dynamic>> get(String path) async {
    final reference = await _database.doc(path).get();
    return reference.data()!;
  }

  Future<bool> isExits(String path) async {
    return (await _database.doc(path).get()).exists;
  }

  Future<Map<String, dynamic>> post(String path, Map<String, dynamic> data) async {
    await _database.doc(path).set(data);
    return data;
  }
}
