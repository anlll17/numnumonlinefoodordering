import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numnum/constants/app_constants.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/cart_item.dart';
import 'package:numnum/models/product.dart';
import 'package:numnum/models/restinfo.dart';
import 'package:numnum/models/user.dart';
import 'package:uuid/uuid.dart';

class CartController extends GetxController {
  static CartController instance = Get.find();
  RxDouble totalCartPrice = 0.0.obs;

  @override
  void onReady() {
    super.onReady();
    ever(userController.userModel, changeCartTotalPrice);
  }

  void addRestYemek(RestInfoModel restModel){
    userController.updateUserData({
      'restId': restModel.restId,
      'yemek': restModel.yemek.map((e) => {
        'durum': e.durum,
        'name': e.name,
        'brand': e.brand,
        'price': e.price,
        'image': e.image,
        'id': e.id,
        'açıklama': e.aciklama
        
      }).toList()
    });
  }
  void addRestIcecek(RestInfoModel restModel){
    userController.updateUserData({
      'restId': restModel.restId,
      'içecek': restModel.icecek.map((e) => {
        'durum': e.durum,
        'name': e.name,
        'brand': e.brand,
        'price': e.price,
        'image': e.image,
        'id': e.id,
        'açıklama': e.aciklama
        
      }).toList()
    });
  }
  void addRestTatli(RestInfoModel restModel){
    userController.updateUserData({
      'restId': restModel.restId,
      'tatlı': restModel.tatli.map((e) => {
        'durum': e.durum,
        'name': e.name,
        'brand': e.brand,
        'price': e.price,
        'image': e.image,
        'id': e.id,
        'açıklama': e.aciklama
        
      }).toList()
    });
  }
  
  void detayEkle(ProductModel product) {
        userController.updateUserData({
          "detay": FieldValue.arrayUnion([
            {
              'durum':product.durum,
              "id": product.id,
              "name": product.name,
              "price": product.price,
              "image": product.image,
              "brand": product.brand,
              "açıklama": '${product.aciklama}'
            }
          ])
        });
      }

  void addProductToCart(ProductModel product) {
    try {
      if (_isItemAlreadyAdded(product)) {
        Get.snackbar("Sepetini kontrol et!", "${product.name} zaten eklenmişti",colorText: Colors.white,backgroundColor: Color(0xff234679));
      } else {
        String itemId = Uuid().toString();
        userController.updateUserData({
          "cart": FieldValue.arrayUnion([
            {
              "id": itemId,
              "productId": product.id,
              "name": product.name,
              "quantity": 1,
              "price": product.price,
              "image": product.image,
              "cost": product.price
            }
          ])
        });
        Get.snackbar("Ürün eklendi", "${product.name} sepetinizde",colorText: Colors.white ,backgroundColor: Color(0xff234679));
      }
    } catch (e) {
      Get.snackbar("Hata", "Ürün şuanda sepete eklenemiyor" ,colorText: Colors.white,backgroundColor: Color(0xff234679));
      debugPrint(e.toString());
    }
  }
  void removeCartItem(CartItemModel cartItem) {
    try {
      userController.updateUserData({
        "cart": FieldValue.arrayRemove([cartItem.toJson()])
      });
      Get.snackbar("Sepetten çıkarıldı", "${cartItem.name} ürünü sepetten çıkarıldı",colorText: Colors.white, backgroundColor: Color(0xff234679));
    } catch (e) {
      Get.snackbar("Hata", "Şu anda bu ürünü sepetten çıkaramıyoruz",colorText: Colors.white, backgroundColor: Color(0xff234679));
      debugPrint(e.message);
    }
  }

  changeCartTotalPrice(UserModel userModel) {
    totalCartPrice.value = 0.0;
    if (userModel.cart.isNotEmpty) {
      userModel.cart.forEach((cartItem) {
        totalCartPrice += cartItem.cost;
      });
    }
  }

  bool _isItemAlreadyAdded(ProductModel product) =>
      userController.userModel.value.cart
          .where((item) => item.productId == product.id)
          .isNotEmpty;

  void decreaseQuantity(CartItemModel item){
    if(item.quantity == 1){
      removeCartItem(item);
    }else{
      removeCartItem(item);
      item.quantity--;
      userController.updateUserData({
        "cart": FieldValue.arrayUnion([item.toJson()])
      });
    }
  }
  void increaseQuantity(CartItemModel item){
    removeCartItem(item);
    item.quantity++;
    logger.i({"quantity": item.quantity});
    userController.updateUserData({
      "cart": FieldValue.arrayUnion([item.toJson()])
    });
  }
  
}
