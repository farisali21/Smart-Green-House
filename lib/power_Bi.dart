import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PowerBI extends StatefulWidget {
  const PowerBI({Key? key}) : super(key: key);

  @override
  State<PowerBI> createState() => _PowerBIState();
}

class _PowerBIState extends State<PowerBI> {

  late final WebViewController controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(const Color(0x00000000))
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          if (request.url.startsWith('https://www.youtube.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(
        'https://app.powerbi.com/reportEmbed?reportId=0caf4f22-abd5-40a8-969d-919e0cc5f24d&autoAuth=true&ctid=5fcc9d9b-e3d3-4e19-ac0c-90aacae677cf'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xff30825C),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 16, right: 16),
            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.drag_handle,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
                ImageIcon(
                  AssetImage("assets/Simple-logo.png"),
                  color: Colors.white,
                  size: 36,
                ),
                Text(
                  'SmartGreenHouse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
                SizedBox(
                  width: 70,
                ),
              ],
            ),
          ),
        ),
      ]),
      body: SafeArea(
        child: Container(
          child: WebViewWidget(controller: controller),
        ),
      ),
    );
  }
}
