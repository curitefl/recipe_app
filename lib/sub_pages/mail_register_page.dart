import 'package:flutter/material.dart';

class MailRegisterPage extends StatelessWidget {
  final String title;

  const MailRegisterPage({Key? key, required this.title}) : super(key: key);

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
