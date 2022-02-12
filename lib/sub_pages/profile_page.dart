import 'package:flutter/material.dart';
import 'package:recipe_app/text_data.dart';

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
                          // TODO 押したら人数を１～１０で選べるようにする
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
