// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/screens/home/widgets/siparisler.dart';
import 'package:numnum/widgets/custom_btn.dart';

import '../home.dart';
import 'shopping_cart.dart';

class InfoScreen extends StatelessWidget {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController adres = TextEditingController();
  TextEditingController telefon = TextEditingController();
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
        drawer:  Drawer(
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
                  leading: Icon(Icons.calendar_today_rounded),
                  title: Text('Geçmiş Siparişler', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff234679),
                    ),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OrderScreen()));
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
       
        body: SingleChildScrollView(
                child: Column(
            children: [
              
             
              Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(.5),
                blurRadius: 10,

              )
            ],
            borderRadius: BorderRadius.circular(20)
        ),
        child: Wrap(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: StreamBuilder<DocumentSnapshot>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(userController.userModel.value.id)
                          .snapshots(),
                      builder: (BuildContext context, AsyncSnapshot asyncSnapshot) {
                        if(asyncSnapshot.hasError){
                   return Center(child: Text('Üzgünüz, Bilgilerinizi yükleyemiyoruz.Lütfen daha sonra tekrar deneyiniz.'));
                   }
                   else{
                     if(asyncSnapshot.hasData){
                       return Column(
                          children: [
                            Center(
                                child: Text(
                              'Bilgileriniz',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,color: Color(0xff234679),),
                            )),
                            ListTile(
                              title: Text('İsim: ' +'${asyncSnapshot.data.data()['name']}' + '\n' + 'Adres: ' +'${asyncSnapshot.data.data()['adres']}'+ '\n' + 'Telefon: ' +'${asyncSnapshot.data.data()['telefon']}', style: TextStyle(fontSize: 20,color: Color(0xff234679),))
                            ),
                          ],
                        );
                     }else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                   }
                        
                      }),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      
                      controller: name,
                      decoration: InputDecoration(
                          icon: Icon(Icons.person),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Name"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      controller: adres,
                      decoration: InputDecoration(
                          icon: Icon(Icons.location_on),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Adres"),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.2,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.grey.withOpacity(.3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      controller: telefon,
                      decoration: InputDecoration(
                          icon: Icon(Icons.phone),
                          fillColor: Colors.white,
                          border: InputBorder.none,
                          hintText: "Telefon"),
                    ),
                  ),
                ),
              ],
            ),
           
            Padding(
              padding: const EdgeInsets.all(25),
              child: CustomButton(
                bgColor: Color(0xff234679),
                  text: "Güncelle", onTap: (){
                      _updateUserToFirestore(userController.userModel.value.id);
                  }),
            )
          ],
        ),
      ),
            ],
          ),
        ),
      ),
    );
  }
  _updateUserToFirestore(String userId) {
    FirebaseFirestore.instance.collection('users').doc(userId).update({
      "name": name.text.trim(),
      "adres": adres.text.trim(),
      "telefon": telefon.text.trim(),
    });
  }
}