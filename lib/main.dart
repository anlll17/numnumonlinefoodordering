import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numnum/controllers/cart_controller.dart';
import 'package:numnum/controllers/orderedItemsController.dart';
import 'package:numnum/screens/authentication/widgets/login.dart';
import 'package:numnum/screens/home/home.dart';
import 'package:numnum/screens/home/widgets/giris/giris_ekran%C4%B1.dart';
import 'package:numnum/screens/splash/splash.dart';

import 'constants/firebase.dart';
import 'controllers/appController.dart';
import 'controllers/authController.dart';
import 'controllers/comController.dart';
import 'controllers/restInfoController.dart';

var routes = <String, WidgetBuilder>{
  "/auth": (BuildContext context) => LoginWidget(),
  "/home": (BuildContext context) => HomeScreen(),
};

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialization.then((value){
    Get.put(AppController());
    Get.put(ComController());
    Get.put(UserController());
    Get.put(CartController());
    Get.put(RestInfoController());
    Get.put(OrderedItemsController());

  });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Online Sipariş',
      theme: ThemeData(
        primaryColor: Color(0xff234679),
      ),
      home: HomeScreen(),
    );
  }
}
