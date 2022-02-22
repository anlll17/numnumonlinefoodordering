import 'dart:async';
import 'package:get/get.dart';
import 'package:numnum/constants/firebase.dart';
import 'package:numnum/models/restinfo.dart';

class RestInfoController extends GetxController {
  static RestInfoController instance = Get.find();
  RxList<RestInfoModel> restInfoModel = RxList<RestInfoModel>([]);
  String collection = "restUsers";

  @override
  onReady() {
    super.onReady();
    restInfoModel.bindStream(getAllRestaurants());
    
  }

  Stream<List<RestInfoModel>> getAllRestaurants() =>
      firebaseFirestore.collection(collection).where('durum', isEqualTo: 'açık').snapshots().map((query) =>
          query.docs.map((item) => RestInfoModel.fromMap(item.data())).toList());
}