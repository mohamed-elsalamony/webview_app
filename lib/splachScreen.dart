
import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // startTimer();
     
  }

  bool isLoading = false;
  // void startTimer() {
  //   Timer.periodic(const Duration(seconds: 5), (t) {
  //     setState(() {
  //       Navigator.pushReplacement(context, MaterialPageRoute(
  //         builder: (context) {
  //           return HomePage();
  //         },
  //       ));
  //     });
  //     t.cancel(); //stops the timer
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return SafeArea(
          child:
           Scaffold(
              body:
               SizedBox(
                height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                 child: Stack(
                           children: [
                             Image.asset(
                  "assets/images/photo_2023-05-12_23-59-12.jpg",
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                             ),
                             FadeInLeft(
                              animate: true,
                               child: Image.asset(
                               "assets/images/photo_2023-05-13_00-10-22.jpg",
                                                         
                                              
                                               ),
                             ),
                     Positioned(
                      right: 0.r,
                          top: 250,
                       child: FadeInRight(
                        animate: true,
                        delay: const Duration(milliseconds: 80),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 20, bottom: 50).r,
                          child: Column(
                          
                            children: [
                              Image.asset(
                                "assets/images/photo_2023-05-11_05-10-39.jpg",
                                width: 120.w,
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text("السلسله الذهبية",
                                  style: TextStyle(
                                      fontFamily: "atiaa",
                                      fontSize: 12.sp,
                                      color: const Color.fromARGB(255, 3, 68, 98))),
                              Text(
                                "للكمياء الشقيه",
                                style: TextStyle(
                                    fontFamily: "atiaa",
                                    fontSize: 15.sp,
                                    color: const Color.fromARGB(255, 3, 68, 98)),
                              ),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                "الاستاذ ",
                                style: TextStyle(
                                    fontFamily: "atiaa",
                                    fontSize: 20.sp,
                                    color: Colors.red),
                              ),
                              Text(
                                "مينا عطيه ",
                                style: TextStyle(
                                    fontFamily: "atiaa",
                                    fontSize: 20.sp,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                                       ),
                     )
                           ],
                         ),
               )),
        );
      },
    );
  }
}
     
   
             