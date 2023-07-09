import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'package:minaa_atiaass/webView.dart';
import 'package:minaa_atiaass/webview2.dart';




// void main() {
  
//   runApp(const MyApp());
//   // disableCaputure();
// }

// disableCaputure() async {
//   await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
      
//       debugShowCheckedModeBanner: false,
//       title: 'مينا عطية',
//       theme: ThemeData(
        
//         primarySwatch: Colors.blue,
//       ),
//       home:HomePage(),
//     );
//   }
// }
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  // Plugin must be initialized before using
  await FlutterDownloader.initialize(
      debug: true,
      // optional: set to false to disable printing logs to console (default: true)
      ignoreSsl:
          false // option: set to false to disable working with http links (default: false)
      );

  runApp(const MaterialApp(home: MyApp()));
}
