class OrderedItemModel {
  static const NAME = "ürün";
  static const PRICE = "fiyat";
  static const ADET = "adet";


  String urun;
  double adet;
  double fiyat;



  OrderedItemModel({this.urun, this.fiyat, this.adet});

  OrderedItemModel.fromMap(Map<String, dynamic> data){
    urun = data[NAME];
    adet = data[ADET].toDouble();
    fiyat = data[PRICE].toDouble();

  }
}