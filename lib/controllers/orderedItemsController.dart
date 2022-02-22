import 'dart:async';
import 'package:get/get.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/constants/firebase.dart';
import 'package:numnum/models/orders.dart';

class OrderedItemsController extends GetxController {
  static OrderedItemsController instance = Get.find();
  RxList<OrderedModel> orderedModel = RxList<OrderedModel>([]);

  @override
  onReady() {
    super.onReady();
    orderedModel.bindStream(getAllOrders());
    
  }

  Stream<List<OrderedModel>> getAllOrders() =>
      firebaseFirestore.collection('users').doc(userController.firebaseUser.value.uid).collection('orders').orderBy('zaman', descending: true).limit(10).snapshots().map((query) =>
          query.docs.map((item) => OrderedModel.fromMap(item.data())).toList());
}