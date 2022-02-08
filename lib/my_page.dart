import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String title;
  const MyPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: Colors.green,
        child: Material(
          child: ListView(
              children: [
                ListTile(
                  title: Text('ListTile with red background'),
                  tileColor: Colors.red,
                ),
                ListTile(
                  title: Text('ListTile with red background'),
                  tileColor: Colors.red,
                ),
              ],
          ),
        ),
      ),
    );
  }
}