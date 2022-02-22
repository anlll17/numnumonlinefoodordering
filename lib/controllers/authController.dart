import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numnum/constants/app_constants.dart';
import 'package:numnum/constants/firebase.dart';
import 'package:numnum/models/user.dart';
import 'package:numnum/screens/authentication/auth.dart';
import 'package:numnum/screens/authentication/widgets/login.dart';
import 'package:numnum/screens/home/home.dart';
import 'package:numnum/screens/home/widgets/giris/giris_ekran%C4%B1.dart';
import 'package:numnum/utils/helpers/showLoading.dart';

class UserController extends GetxController {
  static UserController instance = Get.find();
  Rx<User> firebaseUser;
  RxBool isLoggedIn = false.obs;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  String usersCollection = "users";
  Rx<UserModel> userModel = UserModel().obs;
  TextEditingController adres = TextEditingController();
  TextEditingController telefon = TextEditingController();

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen(), duration: Duration(seconds: 3), opaque: false);
    } else {
      userModel.bindStream(listenToUser());
      Get.offAll(() => HomeScreen(), duration: Duration(seconds: 3), opaque: false);
    }
  }

  void signIn() async {
    try {
      Get.snackbar("Giriş Başarılı", "Yönlendiriliyorsunuz",colorText: Colors.white,backgroundColor: Color(0xff234679));
      await auth
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Giriş Başarısız", "Tekrar Deneyin",colorText: Colors.white,backgroundColor: Color(0xff234679));
    }
  }

  void signUp() async {
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim())
          .then((result) {
        String _userId = result.user.uid;
        _addUserToFirestore(_userId);
        _clearControllers();
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Kayıt Başarısız", "Tekrar Deneyin");
    }
  }
  void signInAnanymous() async {
    try {
      await auth
          .signInAnonymously()
          .then((result) {
        String _userId = result.user.uid;
        _addAnonimToFirestore(_userId);
      });
    } catch (e) {
      debugPrint(e.toString());
      Get.snackbar("Giriş Başarısız", "Tekrar Deneyin");
    }
  }

  void signOut() async {
    auth.signOut();
  }

  _addUserToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": name.text.trim(),
      "id": userId,
      "email": email.text.trim(),
      "cart": [],
      "adres": adres.text.trim(),
      "telefon": telefon.text.trim(),
      "pdt": []
    });
  }
   _addAnonimToFirestore(String userId) {
    firebaseFirestore.collection(usersCollection).doc(userId).set({
      "name": '',
      "id": userId,
      "email": 'anonim',
      "cart": [],
      "adres": 'anonim',
      "telefon": 'anonim',
      "pdt": []
    });
  }

 

  _clearControllers() {
    name.clear();
    email.clear();
    password.clear();
  }

  updateUserData(Map<String, dynamic> data) {
    logger.i("UPDATED");
    firebaseFirestore
        .collection(usersCollection)
        .doc(firebaseUser.value.uid)
        .update(data);
  }

  Stream<UserModel> listenToUser() => firebaseFirestore
      .collection(usersCollection)
      .doc(firebaseUser.value.uid)
      .snapshots()
      .map((snapshot) => UserModel.fromSnapshot(snapshot));
}
