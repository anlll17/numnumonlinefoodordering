import 'package:flutter/material.dart';
import 'package:numnum/models/cart_item.dart';
import 'package:numnum/widgets/custom_text.dart';

class OrderItemWidget extends StatelessWidget {
  final CartItemModel orderItem;

  const OrderItemWidget({Key key, this.orderItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.center,
      children: [
        Expanded(
            child: Wrap(
              direction: Axis.vertical,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 14),
                    child: CustomText(
                      text: "Ürün: " + orderItem.name,
                    )),
                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.center,
                  children: [
                    
                    Padding(
                      padding:
                      const EdgeInsets.all(
                          8.0),
                      child: CustomText(
                        text: "Adet: " +orderItem.quantity.toString(),
                      ),
                    ),
                   
                  ],
                )
              ],
            )),
        Padding(
          padding:
          const EdgeInsets.all(14),
          child: CustomText(
            text: "\₺${orderItem.cost}",
            size: 22,
            weight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
