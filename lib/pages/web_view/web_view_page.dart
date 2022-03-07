import 'package:flutter/material.dart';
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
            appBar: AppBar(
              centerTitle: true,
              title: Text(title),
              actions: [
                    IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: model.reload,  // ページ再読み込みが機能しない
                    ),
              ],
            ),
            body: WebView(
              initialUrl: '${TextData.googleSearch}${args.message}',
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                model.setWebViewController(controller);
              },
            ),
          );
        }
      ),
    );
  }
}
