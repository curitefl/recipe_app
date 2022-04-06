import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/global_notification.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/version_check_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// 強制アップデートダイアログを出す為のダミーStatefulWidget
class Updater extends StatefulWidget {
  const Updater({Key? key}) : super(key: key);

  @override
  State<Updater> createState() => _UpdaterState();
}

class _UpdaterState extends State<Updater> {
  @override
  void initState() {
    final checker = GlobalNotification.locator<VersionCheckService>();
    checker.versionCheck().then((needUpdate) => _showUpdateDialog(needUpdate));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.0.w,
    );
  }

  /// 更新版案内ダイアログを表示
  void _showUpdateDialog(bool needUpdate) {
    if (!needUpdate) {
      return;
    }
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text(TextData.updateDialogTitle),
                content: const Text(TextData.updateDialogMessage),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      TextData.updateDialogButtonLabel,
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => _launchURL(TextData.appStoreURL),
                  ),
                ],
              )
            : AlertDialog(
                title: const Text(TextData.updateDialogTitle),
                content: const Text(TextData.updateDialogMessage),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      TextData.updateDialogButtonLabel,
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => _launchURL(TextData.playStoreURL),
                  ),
                ],
              );
      },
    );
  }
}

/// 指定のURLを起動する. App Store or Play Storeのリンク
void _launchURL(String url) async {
  final bool _canLaunch = await canLaunch(url);
  if (!_canLaunch) {
    throw 'Could not launch $url';
  }
  await launch(url);
}
