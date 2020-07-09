import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_model.dart';

class UserModel extends BaseModel {
  String name;
  String bio;
  String photoUrl;
  String email;

  UserModel({this.name, this.bio, this.photoUrl, this.email});

  UserModel.fromMap(DocumentSnapshot document) {
    fromBaseMap(document);
    name = document.data['name'];
    bio = document.data['bio'];
    photoUrl = document.data['photoUrl'];
    email = document.data['email'];
  }

  @override
  Map toMap() {
    final map = <String, dynamic>{};

    map.addAll(toBaseMap());

    map['name'] = name;
    map['bio'] = bio;
    map['photoUrl'] = photoUrl;
    map['email'] = email;

    return map;
  }
}
