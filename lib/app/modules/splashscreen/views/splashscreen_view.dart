import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:gread/app/routes/app_pages.dart';

import '../controllers/splashscreen_controller.dart';

class SplashscreenView extends GetView<SplashscreenController> {
  const SplashscreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
     Future.delayed(const Duration(milliseconds: 4000), () {
      Get.offAllNamed(Routes.LOGIN);
    });
    return Scaffold(
      body:  Container(
        color: Color(0xFF555555),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image(image: AssetImage('assets/logo.png'),width: 300,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Sempurnakan',style: TextStyle(color: Color(0xFF37B3CE),fontSize: 20,fontWeight: FontWeight.bold)),
                SizedBox(width: 5),
                Text('Literasi Anda',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 100)),
            CircularProgressIndicator()
          ],
        ),
      )
    );
  }
}
