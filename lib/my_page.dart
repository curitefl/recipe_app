import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  final String title;
  static const List<String> myPageColumns = [
    'お気に入りレシピ',
    'コラム',
    'プロフィール変更',
    'メールアドレス登録',
    '冷蔵庫共有',
    '設定',
  ];

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
          child: ListView.builder(
            itemCount: myPageColumns.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    )
                  ),
                  child: ListTile(
                    title: Text(myPageColumns[index]),
                  ),
                );
              },
          ),
        ),
      ),
    );
  }
}