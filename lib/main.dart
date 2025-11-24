import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFF0000),
        title: Text(widget.title),
      ),
      body: const ResizableWebView(
        url: "http://192.168.3.103:19000/",
      ),
    );
  }
}

class ResizableWebView extends StatefulWidget {
  final String url;

  const ResizableWebView({super.key, required this.url});

  @override
  State<ResizableWebView> createState() => _ResizableWebViewState();
}

class _ResizableWebViewState extends State<ResizableWebView> {
  double _height = 300.0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      child: InAppWebView(
        initialUrlRequest: URLRequest(url: WebUri.uri(Uri.parse(widget.url))),
        initialSettings: InAppWebViewSettings(
          isInspectable: true,
        ),
        onWebViewCreated: (controller) {
          controller.addJavaScriptHandler(
            handlerName: 'onEvent',
            callback: (args) {
              print(args);
              if (args.isNotEmpty && args[0] is Map) {
                final event = args[0] as Map;
                if (event['type'] == 'resize' && event['height'] != null) {
                  setState(() {
                    _height = (event['height'] as num).toDouble();
                  });
                }
              }
            },
          );
        },
      ),
    );
  }
}