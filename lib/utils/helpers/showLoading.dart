import 'package:flutter/material.dart';
import 'package:get/get.dart';

showLoading(){
  Get.defaultDialog(
    backgroundColor: Color(0xff234679),
    title: "Yükleniyor", titleStyle: TextStyle(color:Colors.white),
    content: CircularProgressIndicator(),
    barrierDismissible: true,
  );
}

dismissLoadingWidget(){
  Duration(seconds: 2);
}