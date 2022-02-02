import 'package:flutter/material.dart';
	// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
  import 'package:webview_flutter/webview_flutter.dart';
	

	class MapsScreen extends StatelessWidget {
    const MapsScreen({Key? key}) : super(key: key);
	  final String url = 'https://www.bing.com/covid/local/india';
	

	  @override
	  Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Covid19 tracker'),
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            child: const WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: 'https://www.bing.com/covid/local/india',

            ),
          ),
        ),
      );
	    // return WebviewScaffold(
	    //   appBar: AppBar(
	    //     title: const Text('Live Map'),
	    //   ),
	    //   url: url,
	    //   withZoom: true,
	    //   withLocalStorage: true,
	    // );
	  }
	}





