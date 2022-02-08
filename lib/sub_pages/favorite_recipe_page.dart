import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteRecipePage extends StatelessWidget {
  final String title;

  const FavoriteRecipePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: const DefaultTabController(
        length: 5,
        child: TabBar(
          tabs: [
            Tab(text: '主菜'),
            Tab(text: '副菜'),
            Tab(text: '汁物'),
            Tab(text: 'ご飯物'),
            Tab(text: 'デザート'),
          ],
        ),
      ),
    );
  }
}