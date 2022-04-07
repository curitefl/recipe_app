import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/global_notification.dart';
import 'package:recipe_app/text_data.dart';
import 'package:recipe_app/version_check_service.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogUtil {

  Future<bool> forceUpdateDialog(BuildContext context) async{
    final checker = GlobalNotification.locator<VersionCheckService>();
    final bool needUpdate = await checker.versionCheck();

    if (!needUpdate) {
      return needUpdate;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text(TextData.updateDialogTitle),
                content: const Text(TextData.updateDialogMessage),
                actions: [
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
                actions: [
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
    return needUpdate;
  }

  /// 指定のURLを起動する. App Store or Play Storeのリンク
  void _launchURL(String url) async {
    final bool _canLaunch = await canLaunch(url);
    if (!_canLaunch) {
      throw 'Could not launch $url';
    }
    await launch(url);
  }
}
