import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/orders.dart';
import 'package:numnum/screens/home/widgets/bilgiler.dart';
import 'package:numnum/screens/home/widgets/icecekler.dart';
import 'package:numnum/screens/home/widgets/tatlilar.dart';
import 'package:numnum/screens/home/widgets/yemekler.dart';
import 'package:numnum/screens/home/widgets/singleOrderWidget.dart';
import 'package:numnum/screens/home/widgets/single_product.dart';

import '../home.dart';
import 'shopping_cart.dart';

class Urunler extends StatelessWidget {
  final OrderedModel order;

  const Urunler({Key key, this.order}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: GestureDetector(
            onTap: (){
                Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                        userController.updateUserData({"cart": FieldValue.delete()});
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
                  accountName: Text(userController.userModel.value.name ?? ""),
                  accountEmail:
                      Text(userController.userModel.value.email ?? ""),
                ),
              ),
              ListTile(
                  leading: Icon(
                    Icons.home_outlined,
                    color: Color(0xff234679),
                  ),
                  title: Text(
                    'Ana Sayfa',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff234679),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }),
              ListTile(
                  leading: Icon(
                    Icons.info_outline,
                    color: Color(0xff234679),
                  ),
                  title: Text(
                    'Kullanıcı Bilgileri',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff234679),
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => InfoScreen()));
                  }),
              ListTile(
                onTap: () {
                  userController.signOut();
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Color(0xff234679),
                ),
                title: Text(
                  "Çıkış Yap",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xff234679),
                  ),
                ),
              )
            ],
          ),
        ),
        body:ListView(
          children: [
            Center(child: Text('Yemekler', style: TextStyle(fontSize: 20,color: Color(0xff234679),fontWeight: FontWeight.bold),)),
            YemeklerWidget(),
            Center(child: Text('Tatlılar',style: TextStyle(fontSize: 20,color: Color(0xff234679),fontWeight: FontWeight.bold),)),
            TatlilarWidget(),
            Center(child: Text('İçecekler',style: TextStyle(fontSize: 20,color: Color(0xff234679),fontWeight: FontWeight.bold),)),
            IceceklerWidget()
          ],
        )
        ));
  }
}