import 'package:numnum/constants/app_constants.dart';
import 'package:numnum/models/product.dart';

class RestInfoModel{
  static const RESTID = "restId";
  static const IMAGE = "image";
  static const ADV = "adv";
  static const ADVE = "adve";
  static const NAME = "name";
  static const ADRES = "adres";
  static const YEMEK = "yemek";
  static const ICECEK = "içecek";
  static const TATLI = "tatlı";
  static const TIME = "time";
  static const DESCRIPTION = "description";
  static const DURUM = "durum";


   String restId;
   String name;
   String adres;
   List<ProductModel> yemek;
   List<ProductModel> icecek;
   List<ProductModel> tatli;
   String image;
   String adv;
   String adve;
   String time;
   String description;
   String durum;


  RestInfoModel({this.durum, this.restId, this.image, this.name, this.adres, this.yemek, this.icecek, this.tatli, this.adv, this.adve, this.time, this.description});

  RestInfoModel.fromMap(Map<String, dynamic> data){
    yemek = _convertYmkItems(data[YEMEK] ?? []);
    icecek = _convertIcecekItems(data[ICECEK] ?? []);
    tatli = _convertTatliItems(data[TATLI] ?? []);
    image = data[IMAGE];
    adv = data[ADV];
    adve = data[ADVE];
    restId = data[RESTID];
    name = data[NAME];
    adres = data[ADRES];
    time = data[TIME];
    description = data[DESCRIPTION];
    durum = data[DURUM];
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