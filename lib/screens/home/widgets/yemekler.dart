import 'package:flutter/material.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/screens/home/widgets/single_product.dart';
import 'package:get/get.dart';

class YemeklerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>GridView.count(
      physics: NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true,
        crossAxisCount: 2,
        childAspectRatio: .73,
        padding: const EdgeInsets.all(10),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 10,
        children: userController.userModel.value.yemek
                      .map((cartItem) => SingleProductWidget(
                            product: cartItem,
                          ))
                      .toList()));
                      
  }
}

