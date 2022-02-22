import 'package:cloud_firestore/cloud_firestore.dart';

class ComModel {
  static const NUMNUM = "numnum";


  String numnum;



  ComModel({this.numnum});

  ComModel.fromSnapshot(DocumentSnapshot snapshot){
    numnum = snapshot.data()[NUMNUM];
  }
}