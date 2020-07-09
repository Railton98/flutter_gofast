import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import '../interfaces/firebase_repository_base_interface.dart';

import '../models/base_model.dart';

class FirebaseRepositoryBase<Model extends BaseModel>
    implements IFirebabseRepositoryBaseInterface<Model> {
  FirebaseRepositoryBase({this.fromMap, this.collection});

  final Model Function(DocumentSnapshot document) fromMap;

  final String collection;

  @override
  Future<String> add(Model model) async {
    model.setCreateTime();
    model.setUpdateTime();

    final collection = Firestore.instance.collection(this.collection);
    final document = await collection.add(model.toMap());

    return document.documentID;
  }

  @override
  Future<void> update(Model model) async {
    model.setUpdateTime();

    final collection = Firestore.instance.collection(this.collection);

    await collection.document(model.documentId()).updateData(model.toMap());
  }

  @override
  Future<void> disable(Model model) async {
    model.disableDocument();

    await update(model);
  }

  @override
  Future<void> enable(Model model) async {
    model.enableDocument();

    await update(model);
  }

  @override
  Future<void> delete(String documentId) async {
    final collection = Firestore.instance.collection(this.collection);

    await collection.document(documentId).delete();
  }

  @override
  Future<Model> getById(String documentId) async {
    final collection = Firestore.instance.collection(this.collection);

    final snapshot = await collection.document(documentId).get();

    return fromMap(snapshot);
  }

  @override
  Future<List<Model>> getAll() async {
    final collection = Firestore.instance.collection(this.collection);

    var list = <Model>[];
    final querySnapshot = await collection.getDocuments();

    await querySnapshot.documents.forEach((element) {
      list.add(fromMap(element));
    });

    return await list;
  }

  @override
  CollectionReference filter() {
    return Firestore.instance.collection(collection);
  }

  @override
  List<Model> fromSnapshotToModelList(List<DocumentSnapshot> documentList) {
    var list = [];

    documentList.forEach((element) {
      list.add(fromMap(element));
    });

    return list;
  }

  Future<StreamSubscription<QuerySnapshot>> listen(
      void Function(QuerySnapshot) onData) async {
    return Firestore.instance.collection(collection).snapshots().listen(onData);
  }
}
