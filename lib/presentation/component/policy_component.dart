import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recipe_app/presentation/component/launch_url_component.dart';
import 'package:recipe_app/presentation/constants/policy_component_constants.dart';

class PolicyComponent {
  final Function _onConfirmed;

  PolicyComponent({
    required final Function onConfirmed,
  }) : _onConfirmed = onConfirmed;

  Future<void> showPolicyDialog(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          child: _createPlatformAlertDialogPolicy(context),
          onWillPop: () async => false,
        );
      },
    );
  }

  Widget _createPlatformAlertDialogPolicy(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0.r),
        ),
      ),
      title: const Text(PolicyComponentConstants.dialogTitle),
      content: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(PolicyComponentConstants.policyURL),
        ),
        shouldOverrideUrlLoading: (controller, action) =>
            _shouldOverrideUrlLoading(controller, action),
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: false,
            clearCache: true,
            useShouldOverrideUrlLoading: true,
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () async {
            await _onConfirmed();
            Navigator.pop(context);
          },
          child: const Text(PolicyComponentConstants.buttonLabel),
        ),
      ],
    );
  }

  Future<NavigationActionPolicy> _shouldOverrideUrlLoading(
      InAppWebViewController controller, NavigationAction action) async {
    final String requestURL = action.request.url.toString();
    LaunchUrlComponent.launchURL(requestURL);
    return NavigationActionPolicy.CANCEL;
  }
}
