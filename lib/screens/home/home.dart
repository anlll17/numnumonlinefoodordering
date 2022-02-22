import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/restinfo.dart';
import 'package:numnum/screens/home/widgets/bilgiler.dart';
import 'package:numnum/screens/home/widgets/restaurants.dart';
import 'package:numnum/screens/home/widgets/siparisler.dart';
import 'package:numnum/screens/home/widgets/shopping_cart.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatelessWidget {
  final RestInfoModel restInfo; 
  const HomeScreen({Key key, this.restInfo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            flexibleSpace: GestureDetector(
              onTap: (){
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    showBarModalBottomSheet(
                      barrierColor: Color(0xff234679),
                      context: context,
                      builder: (context) => Container(
                        color: Colors.white,
                        child: ShoppingCartWidget(),
                      ),
                    );
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => OrderScreen()));
                    }),
                ListTile(
                    leading: Icon(
                      Icons.info_outline,
                      color: Color(0xff234679),
                    ),
                    title: Text('Kullanıcı Bilgileri'),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InfoScreen()));
                    }),
                ListTile(
                  onTap: () {
                    userController.signOut();
                  },
                  leading: Icon(
                    Icons.exit_to_app,
                    color: Color(0xff234679),
                  ),
                  title: Text("Çıkış Yap"),
                ),
                ListTile(
                    leading: Icon(
                      Icons.phone,
                      color: Color(0xff234679),
                    ),
                    title: Text('Whatsapp Canlı Yardım'),
                    onTap: () {
                      openwhatsapp();
                    }),
              ],
            ),
          ),
          body:
           
              Container(
                color: Colors.white30,
                child: RestaurantsWidget(),
              ),
          )
    );
  }
  openwhatsapp() async{
  var whatsapp ="${comController.comModel.value.numnum}";
  var whatsappUrlAndroid = "whatsapp://send?phone="+whatsapp+"&text=Yardıma ihtiyacım var";
  var whatappUrlIos ="https://wa.me/$whatsapp?text=${Uri.parse("Yardıma ihtiyacım var")}";
  if(Platform.isIOS){
    // for iOS phone only
    if( await canLaunch(whatappUrlIos)){
       await launch(whatappUrlIos, forceSafariVC: false);
    }else{
      Get.snackbar("Whatsapp yüklenmedi", "Tekrar Deneyin",colorText: Colors.white,backgroundColor: Color(0xff234679));

    }

  }else{
    // android , web
    if( await canLaunch(whatsappUrlAndroid)){
      await launch(whatsappUrlAndroid);
    }else{
      Get.snackbar("Whatsapp yüklenmedi", "Tekrar Deneyin",colorText: Colors.white,backgroundColor: Color(0xff234679));

    }


  }

}

}
