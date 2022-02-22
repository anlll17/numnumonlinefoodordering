import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:numnum/constants/controllers.dart';
import 'package:numnum/screens/authentication/auth.dart';
import 'package:numnum/screens/home/widgets/cart_item_widget.dart';
import 'package:numnum/screens/home/widgets/sepet_onay.dart';
import 'package:numnum/widgets/custom_btn.dart';
import 'package:numnum/widgets/custom_text.dart';

class ShoppingCartWidget extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            SizedBox(
              height: 10,
            ),
            Center(
              child: CustomText(
                text: "Sepetiniz",
                size: 24,
                weight: FontWeight.bold,
                color: Color(0xff234679),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Obx(() => Column(
                  children: userController.userModel.value.cart
                      .map((cartItem) => CartItemWidget(
                            cartItem: cartItem,
                          ))
                      .toList(),
                )),
          ],
        ),
       Positioned(
            bottom: 30,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                child: Obx(
                  () => CustomButton(
                    bgColor: Color(0xff234679),
                    text:
                        "Öde (\₺${cartController.totalCartPrice.value.toStringAsFixed(2)})",
                    onTap: (){
                      if(userController.userModel.value.cart.isNotEmpty){
                        Navigator.push(context,  MaterialPageRoute(builder: (context) => OnaySayfasi()));
                      }else{
                       Get.snackbar("Sepetinizde ürün bulunmamaktadır.", "Boş sipariş gönderemezsiniz.",colorText: Colors.white,backgroundColor: Color(0xff234679));
                     }
                     
                    },
                  ),
                ))),
        
      ],
    );
  }
}
