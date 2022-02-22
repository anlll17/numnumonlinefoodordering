import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numnum/controllers/appController.dart';
import 'package:numnum/screens/authentication/widgets/bottom_text.dart';
import 'package:numnum/screens/authentication/widgets/login.dart';
import 'package:numnum/screens/authentication/widgets/registration.dart';

class AuthenticationScreen extends StatelessWidget {
  final AppController _appController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
          backgroundColor: Color(0xff234679),
          body: Obx(
            () => SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.width / 5),
                  Container(
                    width: 150,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        fit: BoxFit.contain,
                        image: AssetImage(
                          'images/log.png',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.width / 30),
                  Text('Hoş Geldiniz', style:TextStyle(color: Colors.white, fontSize: 25, fontWeight:FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.width / 30),
                  Visibility(
                      visible: _appController.isLoginWidgetDisplayed.value,
                      child: LoginWidget()),
                  Visibility(
                      visible: !_appController.isLoginWidgetDisplayed.value,
                      child: RegistrationWidget()),
                  
                  Visibility(
                    visible: _appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        _appController.changeDIsplayedAuthWidget();
                      },
                      text1: "Hesabınız yok mu?",
                      text2: "Kayıt olun",
                    ),
                  ),
                  Visibility(
                    visible: !_appController.isLoginWidgetDisplayed.value,
                    child: BottomTextWidget(
                      onTap: () {
                        _appController.changeDIsplayedAuthWidget();
                      },
                      text1: "Zaten bir hesabınız var mı?",
                      text2: "Giriş yapın",
                    ),
                  ),
                  SizedBox(height:10)
                ],
              ),
            ),
          )),
    );
  }
}
