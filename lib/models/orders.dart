import 'package:numnum/constants/app_constants.dart';
import 'package:numnum/models/orderedItems.dart';

class OrderedModel {
  static const ADRES = "adres";
  static const NAME = "isim";
  static const NOT = "not";
  static const TELEFON = "telefon";
  static const TOPLAM = "toplam";
  static const ZAMAN = "zaman";
  static const SIPARIS = "Sipariş";


  String adres;
  String name;
  String not;
  String telefon;
  double toplam;
  String zaman;
  List<OrderedItemModel> siparis;



  OrderedModel({this.adres, this.name, this.not, this.telefon, this.toplam, this.zaman, this.siparis});

  OrderedModel.fromMap(Map<String, dynamic> data){
    siparis = _convertOrderItems(data[SIPARIS] ?? []);
    adres = data[ADRES];
    name = data[NAME];
    not = data[NOT];
    telefon = data[TELEFON];
    zaman = data[ZAMAN];
    toplam = data[TOPLAM].toDouble();

  }
  List<OrderedItemModel> _convertOrderItems(List cartFomDb){
    List<OrderedItemModel> _result = [];
    logger.i(cartFomDb.length);
    cartFomDb.forEach((element) {
      _result.add(OrderedItemModel.fromMap(element));
    });
    return _result;
  }
}