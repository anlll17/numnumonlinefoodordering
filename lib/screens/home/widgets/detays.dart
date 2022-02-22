import 'package:flutter/material.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';
import 'package:numnum/screens/home/widgets/urun_detay.dart';

class Detays extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>GridView.count(
        crossAxisCount: 1,
        childAspectRatio: .53,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: userController.userModel.value.detay
                      .map((cartItem) => Detay(
                            detay: cartItem,
                          ))
                      .toList()));
  }
}