import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/restinfo.dart';
import 'package:numnum/screens/authentication/auth.dart';
import 'package:numnum/screens/home/home.dart';
import 'package:numnum/screens/home/widgets/bilgiler.dart';
import 'package:numnum/screens/home/widgets/giris/restaurants.dart';
import 'package:numnum/screens/home/widgets/restaurants.dart';
import 'package:numnum/screens/home/widgets/siparisler.dart';
import 'package:numnum/screens/home/widgets/shopping_cart.dart';
import 'package:numnum/screens/splash/splash.dart';

class GirisEkrani extends StatelessWidget {
  final RestInfoModel restInfo; 
  const GirisEkrani({Key key, this.restInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: GestureDetector(
              onTap: (){
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GirisEkrani()));
              },
              child: Image(
                image: AssetImage('images/log.png'),
                fit: BoxFit.contain,
              ),
            ),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.menu_rounded, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            backgroundColor: Color(0xff234679),
            iconTheme: IconThemeData(color: Colors.black),
            actions: [
              Center(child: Text('Giriş Yap')),
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.login),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuthenticationScreen()));
                  })
            ],
            elevation: 0,
            centerTitle: true,
          ),
          backgroundColor: Colors.white,
          drawer: Drawer(
            child: ListView(
              children: [
                Obx(
                  () => UserAccountsDrawerHeader(
                    currentAccountPictureSize: Size.square(100),
                    currentAccountPicture: Image(
                      image: AssetImage('images/log.png'),
                    ),
                    decoration: BoxDecoration(color: Color(0xff234679)),
                    accountName:
                        Text(userController.userModel.value.name ?? ""),
                    accountEmail:
                        Text(userController.userModel.value.email ?? ""),
                  ),
                ),
                ListTile(
                    leading: Icon(
                      Icons.calendar_today_outlined,
                      color: Color(0xff234679),
                    ),
                    title: Text('Geçmiş Siparişler'),
                    onTap: () {
                      Get.snackbar('Giriş yapın.', 'Geçmiş siparişler için giriş yapmalısınız.',colorText: Colors.white,backgroundColor: Color(0xff234679));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Color(0xff234679),
                    ),
                    title: Text('Kullanıcı Bilgileri'),
                    onTap: () {
                      Get.snackbar('Giriş Yapın.', 'Bilgileri görüntülemek için giriş yapmalısınız.',colorText: Colors.white,backgroundColor: Color(0xff234679));
                    }),
                ListTile(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AuthenticationScreen()));
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xff234679),
                  ),
                  title: Text("Giriş Yap"),
                )
              ],
            ),
          ),
          body:
           
              Container(
                color: Colors.white30,
                child: GirisRests(),
              ),
          )
    );
  }
}