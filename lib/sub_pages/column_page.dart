import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text_data.dart';

class ColumnPage extends StatelessWidget {
  final String title;
  static const List<String> columnPageListView = [
    '旬の食材',
    '料理の基本',
    '栄養素',
    '調味料',
    'その他',
  ];

  const ColumnPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Colors.pink,
                ),
                hintText: TextData.search,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.pink,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Material(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: columnPageListView.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.black38),
                    ),
                  ),
                  child: ListTile(
                    title: Text(columnPageListView[index]),
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      // TODO
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
