import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageModel extends ChangeNotifier {
  WebViewController? _webViewController;
  bool _canGoBack = false;
  bool _canGoForward = false;

  void isAndroid() {
    if(Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void setWebViewController (controller) {
    _webViewController = controller;
  }

  void reload() {
    _webViewController?.reload;
    notifyListeners();
  }
}