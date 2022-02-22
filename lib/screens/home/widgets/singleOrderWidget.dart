import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/models/orderedItems.dart';
import 'package:numnum/models/orders.dart';

class SingleOrder extends StatelessWidget {
  final OrderedModel orderedModel;
  final OrderedItemModel orderedItem;

  const SingleOrder({Key, key, this.orderedModel, this.orderedItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('images/log.png'),
        ),
        title: Text(
          'Toplam: ' + orderedModel.toplam.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff234679),
          ),
        ),
        subtitle: Text('Tarih: ' + orderedModel.zaman.toString(),
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xff234679),
            )),
        onLongPress: () {
          showBarModalBottomSheet(
            barrierColor: Color(0xff234679),
            backgroundColor:Colors.grey,
            context: context,
            builder: (context) => Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.perm_identity,color: Color(0xff234679)),
                      title: Text(
                        ' İsim: ' + orderedModel.name.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.location_on_sharp, color: Color(0xff234679)),
                      title: Text(
                        ' Adres: ' + orderedModel.adres.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.phone_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Telefon: ' + orderedModel.telefon.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.timer_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Zaman: ' + orderedModel.zaman.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.note_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Not: ' + orderedModel.not.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.dining_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Ürün Adı: ' + orderedModel.siparis.map((e) => e.urun).toString(),
                        style: TextStyle(fontSize: 18, color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.one_x_mobiledata_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Ürün Adedi: ' + orderedModel.siparis.map((e) => e.adet).toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.attach_money_rounded,color: Color(0xff234679)),
                      title: Text(
                        ' Ürün Fiyatı: ' + orderedModel.siparis.map((e) => e.fiyat).toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width:double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xff234679)),
                      borderRadius:BorderRadius.circular(10)
                      
                    ),
                    child: ListTile(
                      leading: Icon(Icons.summarize_sharp,color: Color(0xff234679)),
                      title: Text(
                        ' Toplam: ' + orderedModel.toplam.toString(),
                        style: TextStyle(fontSize: 18,color: Color(0xff234679),fontWeight: FontWeight.bold,),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
