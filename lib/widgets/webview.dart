import 'dart:async';

import 'package:flutter/material.dart';

import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

final Set<JavascriptChannel> jsChannels = [
  JavascriptChannel(
    name: 'Print',
    onMessageReceived: (JavascriptMessage message) {
      print(message.message);
    }),
].toSet();

class WebView extends StatefulWidget {
  final String url;
  WebView({Key key, @required this.url}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebView> {
  
  // Instance of WebView plugin
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  // On destroy stream
  StreamSubscription _onDestroy;
  // On urlChanged stream
  StreamSubscription<String> _onUrlChanged;
  // On urlChanged stream
  StreamSubscription<WebViewStateChanged> _onStateChanged;
  StreamSubscription<WebViewHttpError> _onHttpError;
  StreamSubscription<double> _onProgressChanged;
  StreamSubscription<double> _onScrollYChanged;
  StreamSubscription<double> _onScrollXChanged;
  
  //final _urlCtrl = TextEditingController(text: selectedUrl);
  //final _codeCtrl = TextEditingController(text: 'window.navigator.userAgent');
  @override
  void initState() {
    super.initState();

    flutterWebViewPlugin.close();

    // _urlCtrl.addListener(() {
    //   selectedUrl = _urlCtrl.text;
    // });

    // Add a listener to on destroy WebView, so you can make came actions.
    _onDestroy = flutterWebViewPlugin.onDestroy.listen((_) {
      if (mounted) {
        // Actions like show a info toast.
        
      }
    });

    // Add a listener to on url changed
    _onUrlChanged = flutterWebViewPlugin.onUrlChanged.listen((String url) {
      if (mounted) {
        
      }
    });

    _onProgressChanged =
        flutterWebViewPlugin.onProgressChanged.listen((double progress) {
      if (mounted) {
        
      }
    });

    _onScrollYChanged =
        flutterWebViewPlugin.onScrollYChanged.listen((double y) {
      if (mounted) {
        
      }
    });

    _onScrollXChanged =
        flutterWebViewPlugin.onScrollXChanged.listen((double x) {
      if (mounted) {
        
      }
    });

    _onStateChanged =
        flutterWebViewPlugin.onStateChanged.listen((WebViewStateChanged state) {
      if (mounted) {
        
      }
    });

    _onHttpError =
        flutterWebViewPlugin.onHttpError.listen((WebViewHttpError error) {
      if (mounted) {
        
      }
    });
  }

  @override
  void dispose() {
    // Every listener should be canceled, the same should be done with this stream.
    _onDestroy.cancel();
    _onUrlChanged.cancel();
    _onStateChanged.cancel();
    _onHttpError.cancel();
    _onProgressChanged.cancel();
    _onScrollXChanged.cancel();
    _onScrollYChanged.cancel();

    flutterWebViewPlugin.dispose();

    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: widget.url,
      javascriptChannels: jsChannels,
      mediaPlaybackRequiresUserGesture: false,
      appBar: AppBar(title: const Text('故事')),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
    );
  }
}