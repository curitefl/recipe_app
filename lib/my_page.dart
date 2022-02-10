import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'my_page_list_tile.dart';

class MyPage extends StatelessWidget {
  final String title;

  final List<MyPageListTile> myPageListView = [
    MyPageListTile('お気に入りレシピ', Icons.favorite_border),
    MyPageListTile('コラム', Icons.book_outlined),
    MyPageListTile('プロフィール変更', Icons.perm_identity),
    MyPageListTile('メールアドレス登録', Icons.mail_outline),
    MyPageListTile('冷蔵庫共有', Icons.kitchen),
    MyPageListTile('設定', Icons.settings),
  ];

  MyPage(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Material(
        child: ListView.builder(
          itemCount: myPageListView.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: const BoxDecoration(
                  border: Border(
                bottom: BorderSide(color: Colors.black38),
              )),
              child: ListTile(
                leading: Icon(myPageListView[index].icon),
                title: Text(myPageListView[index].text),
                trailing: const Icon(Icons.arrow_forward),
                onTap: () {
                  //TODO
                },
              ),
            );
          },
        ),
      ),
    );
  }
}