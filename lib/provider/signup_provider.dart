import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';
import '../widgets/bottom_Nav_Bar.dart';

class SignupProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _obsecure = false;
  bool get obsecure => _obsecure;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKeyy = GlobalKey<FormState>();
  dynamic get formkey => formKeyy;
  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  setobsecure(value) {
    _obsecure = value;
    notifyListeners();
  }

  // ************** Signup function *********************
  void signUp(String email, String password, BuildContext context) async {
    if (formKeyy.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {
                setLoading(false),
                Utils().toastmsj("Signup Successfully"),
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationW()))
              })
          .catchError((e) {
        setLoading(false);
        Utils().toastmsj(e.toString());
      });
    }
  }
}
