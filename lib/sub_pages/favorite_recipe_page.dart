import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteRecipePage extends StatelessWidget {
  final String title;

  const FavoriteRecipePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: '主菜'),
              Tab(text: '副菜'),
              Tab(text: '汁物'),
              Tab(text: 'ご飯物'),
              Tab(text: 'デザート'),
            ],
          ),
        ),
      ),
    );
  }
}
