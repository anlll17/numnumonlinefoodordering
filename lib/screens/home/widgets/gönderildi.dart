import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/user.dart';
import 'package:numnum/widgets/loading.dart';

import '../home.dart';

class Gonderildi extends StatefulWidget {
  @override
  _GonderildiState createState() => _GonderildiState();
}

class _GonderildiState extends State<Gonderildi> {
  Rx<User> firebaseUser;
 @override
  void initState() {
    super.initState();
    yonlendir();
  }

   yonlendir(){
     Timer(Duration(seconds: 3), () => Navigator.pushReplacement(context, MaterialPageRoute(
                                        builder: (context) => HomeScreen()) ));
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff234679),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only( top: 40),
            child: Image.asset(
              'images/log.png',
              width: 150,
              height: 150,
            ),
          ),
          SizedBox(
                  height: 30,
                ),
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(blurRadius: 4, color: Colors.white),
                ],
                color: Color(0xff234679),
                borderRadius: BorderRadius.circular(20)),
            margin: EdgeInsets.only(top: 0, left: 0),
            height: 180,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 0),
                  child: Text(
                    "Siparişiniz Gönderildi",
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    padding: EdgeInsets.only(left: 0),
                    child: Icon(
                      Icons.check_box_rounded,
                      color: Colors.green,
                      size: 50,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: 50,
                  width: 300,
                  child: Center(
                    child: Text(
                      "ANA SAYFAYA YÖNLENDİRİLİYORSUNUZ",
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              Loading(),
            ],
          ),
        ],
      ),
    );
  }
  Stream<UserModel> listenToUser() => FirebaseFirestore.instance
      .collection(userController.usersCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
