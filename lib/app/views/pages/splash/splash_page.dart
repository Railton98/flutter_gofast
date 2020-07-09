import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../models/user_model.dart';
import '../../../repositories/user_repository.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserRepository userRepository;
  String id;

  @override
  void initState() {
    userRepository = Modular.get<UserRepository>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: PageView(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    child: Text('Add User'),
                    onPressed: () async {
                      final user = UserModel(
                        name: 'Railton Leal',
                        bio: 'Software Developer',
                        email: 'railton@hattuns.com',
                        photoUrl: 'http://www.teste.com/img.png',
                      );
                      id = await userRepository.add(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Update User'),
                    onPressed: () async {
                      final user = await userRepository.getById(id);
                      user.name = 'Railton Leal2';
                      userRepository.update(user);
                      print(user.name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Disable User'),
                    onPressed: () async {
                      final user = await userRepository.getById(id);
                      userRepository.disable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Enable User'),
                    onPressed: () async {
                      final user = await userRepository.getById(id);
                      userRepository.enable(user);
                    },
                  ),
                  RaisedButton(
                    child: Text('Delete User'),
                    onPressed: () async {
                      await userRepository.delete(id);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get All'),
                    onPressed: () async {
                      final list = await userRepository.getAll();

                      print(list[0].name);
                    },
                  ),
                  RaisedButton(
                    child: Text('Get Filter'),
                    onPressed: () async {
                      final list = await userRepository
                          .filter()
                          .where('name', isEqualTo: 'Railton Leal2')
                          .where('email', isEqualTo: 'railton@hattuns.com')
                          .orderBy('name', descending: true)
                          .getDocuments()
                          .then((value) => value.documents);
                      userRepository.fromSnapshotToModelList(list);
                    },
                  ),
                ],
              ),
            ),
            ListView(),
          ],
        ),
      ),
    );
  }
}
