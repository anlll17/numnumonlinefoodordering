import 'dart:async';
import 'package:get/get.dart';
import 'package:numnum/constants/firebase.dart';
import 'package:numnum/models/com.dart';
import 'package:numnum/models/restinfo.dart';

class ComController extends GetxController {
  static ComController instance = Get.find();
  Rx<ComModel> comModel = ComModel().obs;
  String collection = "whatsapp";

  @override
  onReady() {
    super.onReady();
    comModel.bindStream(listenToAdmin());
    
  }

  Stream<ComModel> listenToAdmin() => firebaseFirestore
      .collection(collection)
      .doc('ethS1MD1h3srox5m7xLA')
      .snapshots()
      .map((snapshot) => ComModel.fromSnapshot(snapshot));
}