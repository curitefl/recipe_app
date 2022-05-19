import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/presentation/component/launch_url_component.dart';
import 'package:recipe_app/presentation/constants/app_update_component_constants.dart';

class AppUpdateComponent {
  Future<void> showAppUpdateDialog(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Platform.isIOS
            ? CupertinoAlertDialog(
                title: const Text(AppUpdateComponentConstants.updateDialogTitle),
                content: const Text(AppUpdateComponentConstants.updateDialogMessage),
                actions: [
                  TextButton(
                    child: const Text(
                      AppUpdateComponentConstants.updateDialogButtonLabel,
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => LaunchUrlComponent.launchURL(AppUpdateComponentConstants.appStoreURL),
                  ),
                ],
              )
            : AlertDialog(
                title: const Text(AppUpdateComponentConstants.updateDialogTitle),
                content: const Text(AppUpdateComponentConstants.updateDialogMessage),
                actions: [
                  TextButton(
                    child: const Text(
                      AppUpdateComponentConstants.updateDialogButtonLabel,
                      style: TextStyle(color: Colors.red),
                    ),
                    onPressed: () => LaunchUrlComponent.launchURL(AppUpdateComponentConstants.playStoreURL),
                  ),
                ],
              );
      },
    );
  }
}
