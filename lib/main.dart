import 'package:flutter/material.dart';

main() => runApp(new HomePage());

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        body: new Center(
          child: new Text('hello'),
        ),
      ),
    );
  }
}
