import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/restinfo.dart';
import 'package:numnum/screens/home/widgets/yemekler.dart';
import 'package:numnum/screens/home/widgets/restoran_urunleri.dart';

class GirisRest extends StatelessWidget {
  final RestInfoModel rest;

  const GirisRest({Key key, this.rest}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: Offset(3, 2),
                blurRadius: 7)
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: ImageSlideshow(
            
              initialPage: 0,
              indicatorColor: Colors.blue,
              indicatorBackgroundColor: Colors.grey,
              children: [
                Image.network(
                  rest.image,
                  width: double.infinity,
                  height: 250,
                ),
                Image.network(
                  rest.adv,
                  width: double.infinity,
                  height: 250,
                ),
                Image.network(
                  rest.adve,
                  width: double.infinity,
                  height: 250,
                )
              ],
              autoPlayInterval: 0,
              isLoop: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment:CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(Icons.shutter_speed, color: Color(0xff234679)),
                  Text(rest.time + 'dk',style: TextStyle(color: Color(0xff234679),fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          GestureDetector(
            child: Container(
              decoration: BoxDecoration(color: Color(0xff234679)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Menüye Gözat',
                    style: TextStyle(color: Colors.white),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.menu_book_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                      onPressed: () {}),
                ],
              ),
            ),
            onTap: () async{
              Get.snackbar('Giriş yapın','Menüyü görmek için giriş yapmalısınız',colorText: Colors.white,backgroundColor: Color(0xff234679));
             
            },
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}