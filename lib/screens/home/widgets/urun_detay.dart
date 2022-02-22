import 'package:flutter/material.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/detay_model.dart';

class Detay extends StatelessWidget {
  final DetayModel detay;
  const Detay({Key key, this.detay}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Center(
            child: Container(
                child: Text(
              detay.name,
              style: TextStyle(
                  color: Color(0xff234679),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            )),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.5),
                      offset: Offset(3, 2),
                      blurRadius: 7)
                ]),
            height: 250,
            width: double.infinity,
            child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.network(
                  detay.image,
                  width: double.infinity,
                )),
          ),
          SizedBox(height: 20),
          
          Container(
            padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          height: 100,
          width: double.infinity,
          child: Center(
            child: Text(
              detay.aciklama,
              style: TextStyle(
                  color: Color(0xff234679),
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ),
          ),
          SizedBox(height: 20),
          
          Container(
            padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xff234679),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          height: 60,
          width: double.infinity,
          child: Center(
            child: Text(
              "\₺${detay.price}",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Color(0xff234679),
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(.5),
                    offset: Offset(3, 2),
                    blurRadius: 7)
              ]),
          height: 60,
          width: double.infinity,
          child: Center(
            child: Text(
              "Siparişe "+ '${detay.durum}',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          ),
        ],
      ),
    );
  }
}
