import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/models/product.dart';
import 'package:numnum/screens/home/widgets/detays.dart';
import 'package:numnum/screens/home/widgets/urun_detay.dart';
import 'package:numnum/widgets/custom_text.dart';

class SingleProductWidget extends StatelessWidget {
  final ProductModel product;

  const SingleProductWidget({Key key, this.product}) : super(key: key);
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
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    product.image,
                    width: double.infinity,
                  )),
                  onTap: (){
                    userController.updateUserData({"detay": FieldValue.delete()});
                    cartController.detayEkle(product);
                    showBarModalBottomSheet(
                      barrierColor: Color(0xff234679),
                      context: context,
                      builder: (context) => Container(
                        color: Colors.white,
                        child: Detays(),
                      ),
                    );
                  },
            ),
          ),
          CustomText(
            color:Color(0xff234679),
            text: product.name,
            size: 18,
            weight: FontWeight.bold,
          ),
          CustomText(
            text: product.brand,
            color: Colors.grey,
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomText(
                  color:Color(0xff234679),
                  text: "\₺${product.price}",
                  size: 22,
                  weight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  icon: Icon(Icons.add_shopping_cart,color:Color(0xff234679),),
                  onPressed: () {
                    cartController.addProductToCart(product);
                  })
            ],
          ),
        ],
      ),
    );
  }
}
