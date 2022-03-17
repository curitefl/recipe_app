import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:recipe_app/pages/web_view/web_view_page_model.dart';
import 'package:recipe_app/screen_arguments.dart';
import 'package:recipe_app/text_data.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  final String title;

  const WebViewPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return ChangeNotifierProvider<WebViewPageModel>(
      create: (context) => WebViewPageModel()..isAndroid(),
      child: Consumer<WebViewPageModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(50.0.h),
              child: AppBar(
                centerTitle: true,
                title: Text(title),
                titleTextStyle: Theme.of(context).textTheme.headline3,
                actions: [
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: model.reload,  // ページ再読み込みが機能しない
                      ),
                ],
              ),
            ),
            body: WebView(
              initialUrl: '${TextData.googleSearch}${args.message}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: model.setWebViewController,
              onPageFinished: (value) async {
                model.setCanGoBack();
                model.setCanGoForward();
              },
            ),
            persistentFooterButtons: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: model.canGoBack ? model.goBack : null,
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: model.canGoForward ? model.goForward : null,
              )
            ],
          );
        }
      ),
    );
  }
}
