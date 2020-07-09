import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';
import 'firebase_repository_base.dart';

class UserRepository extends FirebaseRepositoryBase<UserModel> {
  @override
  String get collection => 'users';

  @override
  UserModel Function(DocumentSnapshot document) get fromMap =>
      (document) => UserModel.fromMap(document);
}
