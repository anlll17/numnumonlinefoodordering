import 'package:flutter/material.dart';
import 'package:numnum/widgets/loading.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff234679),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only( top: 60),
            child: Image.asset(
              'images/log.png',
              width: 250,
              height: 250,
            ),
          ),
          Container(
            margin: EdgeInsets.only( top: 20),
            child:Text('Hoş Geldiniz', style: TextStyle(color:Colors.white, fontSize: 20),)
          ),
          Container(
            margin: EdgeInsets.only( top: 20),
            child:Text('Uygun sayfaya yönlendiriliyorsunuz..', style: TextStyle(color:Colors.white, fontSize: 15),)
          ),
          SizedBox(height:10),
          Loading()
        ],
      ),
    );
  }
}
