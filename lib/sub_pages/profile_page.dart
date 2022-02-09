import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../text_data.dart';

class ProfilePage extends StatelessWidget {
  final String title;
  const ProfilePage({Key? key, required this.title}) : super(key: key);

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
                Text('必須'),
                TextField(
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
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  children: [
                    Text('いつも作る量'),
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