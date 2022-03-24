import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPageModel extends ChangeNotifier {
  WebViewController? _webViewController;
  bool _canGoBack = false;
  bool _canGoForward = false;

  bool get canGoBack => _canGoBack;
  bool get canGoForward => _canGoForward;

  void isAndroid() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }

  void setWebViewController(controller) {
    _webViewController = controller;
  }

  void reload() {
    _webViewController?.reload();
  }

  void goBack() {
    _webViewController?.goBack();
  }

  void goForward() {
    _webViewController?.goForward();
  }

  void setCanGoBack() async {
    _canGoBack = (await _webViewController?.canGoBack())!;
    notifyListeners();
  }

  void setCanGoForward() async {
    _canGoForward = (await _webViewController?.canGoForward())!;
    notifyListeners();
  }
}