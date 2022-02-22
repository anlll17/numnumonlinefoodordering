import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:numnum/constants/app_constants.dart';
import 'package:numnum/models/cart_item.dart';
import 'package:numnum/models/detay_model.dart';
import 'package:numnum/models/product.dart';

class UserModel {
  static const ID = "id";
  static const NAME = "name";
  static const EMAIL = "email";
  static const CART = "cart";
  static const ADRES = "adres";
  static const TELEFON = "telefon";
  static const YEMEK = "yemek";
  static const ICECEK = "içecek";
  static const TATLI = "tatlı";
  static const RESTID = "restId";
  static const DETAY = "detay";
  static const NUMNUM = "numnum";
  

   String id;
   String numnum;
   String name;
   String email;
   List<CartItemModel> cart;
   List<DetayModel> detay;
   List<ProductModel> yemek;
   List<ProductModel> icecek;
   List<ProductModel> tatli;
   String adres;
   String telefon;
   String restId;

  UserModel({this.numnum,this.detay, this.id, this.name, this.email, this.cart, this.adres, this.telefon, this.yemek, this.icecek, this.tatli, this.restId});

  UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    name = snapshot.data()[NAME];
    numnum = snapshot.data()[NUMNUM];
    email = snapshot.data()[EMAIL];
    id = snapshot.data()[ID];
    cart = _convertCartItems(snapshot.data()[CART] ?? []);
    detay = _convertDetay(snapshot.data()[DETAY] ?? []);
    yemek = _convertYmkItems(snapshot.data()[YEMEK] ?? []);
    icecek = _convertIcecekItems(snapshot.data()[ICECEK] ?? []);
    tatli = _convertTatliItems(snapshot.data()[TATLI] ?? []);
    adres = snapshot.data()[ADRES];
    telefon = snapshot.data()[TELEFON];
    restId = snapshot.data()[RESTID];
  }

  List<CartItemModel> _convertCartItems(List cartFomDb){
    List<CartItemModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(CartItemModel.fromMap(element));
    });
    return _result;
  }
  List<DetayModel> _convertDetay(List cartFomDb){
    List<DetayModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(DetayModel.fromMap(element));
    });
    return _result;
  }
  List<ProductModel> _convertYmkItems(List cartFomDb){
    List<ProductModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(ProductModel.fromMap(element));
    });
    return _result;
  }
  List<ProductModel> _convertIcecekItems(List cartFomDb){
    List<ProductModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(ProductModel.fromMap(element));
    });
    return _result;
  }
  List<ProductModel> _convertTatliItems(List cartFomDb){
    List<ProductModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(ProductModel.fromMap(element));
    });
    return _result;
  }
}
