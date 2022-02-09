import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text_data.dart';

class ProfilePage extends StatelessWidget {
  final String title;
  static String selectNumber = '1';
  final List<String> numberOfPeople = List.generate(10, (index) => '$index');

  ProfilePage({Key? key, required this.title}) : super(key: key);

  void _cupertinoPicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          //Pickerの高さを指定。指定しない場合はフルスクリーン。
          height: 250,
          color: Colors.white,
          child: Column(
            children: [
              TextButton(
                child: const Text('閉じる'),
                onPressed: () => Navigator.of(context).pop(),
              ),
              const Divider(),
              Expanded(
                child: CupertinoPicker(
                  // ループさせるかどうか
                  looping: true,
                  // Pickerのそれぞれの高さ
                  itemExtent: 30,
                  //先程作成したnumberOfPeopleリストをText Widgetに変換して読み込み。
                  children:
                      numberOfPeople.map((number) => Text(number)).toList(),
                  //Pickerの操作を行う度に呼び出し。
                  //selectNumberに選択したnumberOfPeopleを代入。
                  onSelectedItemChanged: (index) {
                    setState(() {
                      selectNumber = numberOfPeople[index];
                    });
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(TextData.required),
                const TextField(
                  decoration: InputDecoration(
                    hintText: TextData.nickName,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.pink,
                        width: 2.0,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    const Text(TextData.usualAmount),
                    OutlinedButton(
                        onPressed: () {
                          // TODO
                        },
                        child: const Text('人数を表示予定')),
                    const Text(TextData.people),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
