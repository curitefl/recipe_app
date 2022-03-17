import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FridgeSharePage extends StatelessWidget {
  final String title;

  const FridgeSharePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0.h),
        child: AppBar(
          centerTitle: true,
          title: Text(title),
          titleTextStyle: Theme.of(context).textTheme.headline3,
        ),
      ),
    );
  }
}
