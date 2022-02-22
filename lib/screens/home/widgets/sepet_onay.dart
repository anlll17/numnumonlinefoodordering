import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/cart_item.dart';
import 'package:numnum/screens/authentication/auth.dart';
import 'package:numnum/screens/home/widgets/g%C3%B6nderildi.dart';

import 'package:numnum/widgets/custom_btn.dart';
import 'package:numnum/widgets/custom_text.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'order_item_widget.dart';

// ignore: must_be_immutable
class OnaySayfasi extends StatefulWidget {
  @override
  State<OnaySayfasi> createState() => _OnaySayfasiState();
}

class _OnaySayfasiState extends State<OnaySayfasi> {
  bool _toggled = false;
  TextEditingController note = TextEditingController();

  String pos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Color(0xff234679),
        iconTheme: IconThemeData(color: Colors.black),
        title: CustomText(
          text: "Sipariş Onay (2/2)",
          color: Colors.white,
          size: 20,
          weight: FontWeight.bold,
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xff234679), width: 2))),
              child: Text('Bilgileriniz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff234679),
                  ))),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.5))),
            child: ListTile(
                title: Text(
              ' İsim: ' +
                  userController.userModel.value.name +
                  '\n ' +
                  'Adres: ' +
                  userController.userModel.value.adres +
                  '\n ' +
                  'Telefon: ' +
                  userController.userModel.value.telefon,
            )),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff234679), width: 2))),
            child: Text('Ürünler',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff234679),
                )),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.5))),
            child: Obx(() => Column(
                  children: userController.userModel.value.cart
                      .map((cartItem) => OrderItemWidget(
                            orderItem: cartItem,
                          ))
                      .toList(),
                )),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff234679), width: 2))),
            child: Text('Sipariş Notu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff234679),
                )),
          ),
          SizedBox(height: 5),
          Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xff234679), width: 0.5))),
              child: TextField(
                controller: note,
                decoration: InputDecoration(
                    icon: Icon(Icons.pending),
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: "Notunuzu buraya yazınız."),
              )),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff234679), width: 2))),
            child: Text('Ödeme Yöntemi',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff234679),
                )),
          ),
          SizedBox(height: 5),
          SwitchListTile(
            activeColor: Color(0xff234679),
            title: Text('Pos cihazı istiyorum: '),
            value: _toggled,
            onChanged: (bool value){
            setState(()=>_toggled=value);
          }),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xff234679), width: 2))),
            child: Text('Sepet Toplamı',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff234679),
                )),
          ),
          SizedBox(height: 5),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.black, width: 0.5))),
            child: ListTile(
                title: Text(' Toplam: ' +
                    cartController.totalCartPrice.value.toStringAsFixed(2) + '₺')),
          ),
          Padding(
            padding: const EdgeInsets.all(25),
            child: CustomButton(
                bgColor: Color(0xff234679),
                text: "Siparişi Gönder",
                onTap: () {
                  if (userController.userModel.value.name.isEmpty) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AuthenticationScreen()));
                    Get.snackbar(
                        "Kayıt Olun", "Anonim olarak sipariş gönderemezsiniz",
                        colorText: Colors.white,
                        backgroundColor: Color(0xff234679));
                  } else {
                    addProducToOrders(
                        userController.userModel.value.cart,
                        cartController.totalCartPrice.value.toStringAsFixed(2),
                        userController.userModel.value.id);
                    addOrderToRest(
                        userController.userModel.value.cart,
                        cartController.totalCartPrice.value.toStringAsFixed(2),
                        userController.userModel.value.id);
                    userController
                        .updateUserData({"cart": FieldValue.delete()});
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Gonderildi()));
                  }
                }),
          )
        ],
      ),
    );
  }

  Future<bool> sendMail(List<CartItemModel> cart, String total) async {
    bool sendStates;
    try {
      String _username = 'numnumonlinesiparis@gmail.com';
      String _password = 'anll1177';

      final smtpServer = new SmtpServer('smtp.gmail.com',
          username: _username,
          password: _password,
          ignoreBadCertificate: false,
          ssl: false,
          allowInsecure: true);

      /* final smtpServer=hotmail(_username, _password); */

      String date = DateTime.now().toString();
      String sendmail = "anl.ozdmr.17@gmail.com";
      String konu = "1 YENİ SİPARİŞ!!";
      String mesajIcerigi = "${cart.map((cp) => {
            '\nÜrün': cp.name,
            '\nAdet': cp.quantity,
            '\nFiyat': cp.price,
          }).toList()}, \nToplam: ${cartController.totalCartPrice.value.toStringAsFixed(2)}, \nAdres:${userController.userModel.value.adres},\nTelefon:${userController.userModel.value.telefon},\n Not:${note.text.trim()},  )}";

      // Create our message.
      final message = Message()
        ..from = Address("$_username")
        ..recipients.add('$sendmail')
        ..subject = konu
        ..text = mesajIcerigi;

      try {
        final sendReport = await send(message, smtpServer);
        sendStates = true;
        print('Message sent: ' + sendReport.toString());
      } on MailerException catch (e) {
        sendStates = false;
        print('Message not sent.');
        for (var p in e.problems) {
          print('Problem: ${p.code}: ${p.msg}');
        }
      }
    } catch (Exception) {
      //Handle Exception
    } finally {}
    return sendStates;
  }

  addProducToOrders(
      List<CartItemModel> cart, String total, String userId) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    FirebaseFirestore.instance
        .collection('users')
        .doc(userController.userModel.value.id)
        .collection('orders')
        .doc('${formattedDate.toString()}')
        .set({
      'Sipariş': cart
          .map((cp) => {
                'ürün': cp.name,
                'adet': cp.quantity,
                'fiyat': cp.price,
              })
          .toList(),
      'toplam': cartController.totalCartPrice.value,
      'adres': userController.userModel.value.adres,
      'telefon': userController.userModel.value.telefon,
      'zaman': formattedDate.toString(),
      'isim': userController.userModel.value.name,
      'not': note.text.trim(),
      'pos': _toggled.toString()
    });
  }

  addOrderToRest(List<CartItemModel> cart, String total, String userId) async {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(now);
    FirebaseFirestore.instance
        .collection('restUsers')
        .doc(userController.userModel.value.restId)
        .collection('orders')
        .doc('${formattedDate.toString()}')
        .set({
      'Sipariş': cart
          .map((cp) => {
                'ürün': cp.name,
                'adet': cp.quantity,
                'fiyat': cp.price,
              })
          .toList(),
      'toplam': cartController.totalCartPrice.value,
      'adres': userController.userModel.value.adres,
      'telefon': userController.userModel.value.telefon,
      'zaman': formattedDate.toString(),
      'isim': userController.userModel.value.name,
      'not': note.text.trim(),
      'pos': _toggled.toString()
    });
  }
}
