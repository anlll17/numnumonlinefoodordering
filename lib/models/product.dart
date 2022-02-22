class ProductModel {
  static const ID = "id";
  static const IMAGE = "image";
  static const NAME = "name";
  static const PRICE = "price";
  static const BRAND = "brand";
  static const ACIKLAMA = "açıklama";
  static const DURUM = "durum";


  String id;
  String image;
  String name;
  String brand;
  double price;
  String aciklama;
  String durum;



  ProductModel({this.durum, this.brand, this.id, this.image, this.name, this.price,this.aciklama});

  ProductModel.fromMap(Map<String, dynamic> data){
    id = data[ID];
    image = data[IMAGE];
    name = data[NAME];
    brand = data[BRAND];
    aciklama = data[ACIKLAMA];
    durum = data[DURUM];
    price = data[PRICE].toDouble();

  }
}