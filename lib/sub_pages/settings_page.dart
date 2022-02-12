import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget{
  final String title;
  const SettingsPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
    );
  }
}