import 'package:flutter/material.dart';

class ScrollWidget extends StatelessWidget {
  final List<Widget> children;

  const ScrollWidget({Key key, this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
