import 'package:flutter/material.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:get/get.dart';
import 'package:numnum/screens/home/widgets/giris/restaurant.dart';
import 'package:numnum/screens/home/widgets/single_restaurant.dart';

class GirisRests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(()=>GridView.count(
        crossAxisCount: 1,
        childAspectRatio: .93,
        padding: const EdgeInsets.all(10),
        crossAxisSpacing: 10,
        children: restInfoController.restInfoModel
                      .map((rest) => GirisRest(
                            rest: rest,
                          ))
                      .toList()));
  }
}