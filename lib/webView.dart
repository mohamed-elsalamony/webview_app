import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   PermissionStatus? permissionStatus;

  Future<void> requestPermissions() async {
    final status = await Permission.storage.request();
    setState(() {
      permissionStatus = status;
    });
  }

  bool isConnected = true;
  Future<void> checkConnectivity() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  String url = "https://minaattia.com/";
  WebViewController controller = WebViewController()
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
          if (request.url.startsWith('https://minaattia.com/')) {
            return NavigationDecision.prevent;
          }
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse('https://minaattia.com/'));
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnectivity();
    requestPermissions();
  }

  @override
  Widget build(BuildContext context) {
    if (permissionStatus == PermissionStatus.granted) {
      return SafeArea(
          child: WillPopScope(
        onWillPop: () async {
          if (await controller.canGoBack()) {
            controller.goBack();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: isConnected
              ? WebViewWidget(
                  controller: controller,
                  
                )
              : Center(
                  child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '  برجاء الاتصال بالانترنت ',
                      style: TextStyle(
                          fontFamily: "atiaa",
                          fontSize: 20.sp,
                          color: Colors.red),
                    ),
                    Text(
                      ' لاستخدام التطبيق ',
                      style: TextStyle(
                          fontFamily: "atiaa",
                          fontSize: 20.sp,
                          color: Colors.red),
                    ),
                  ],
                )),
        ),
      ));
    }else{
      return  const Scaffold(
        body: Center(
          child: Text(
            'Please grant the necessary permissions to use this app.',
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }
}
