import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../utils/utils.dart';
import '../widgets/bottom_Nav_Bar.dart';

class LoginProvider with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;
  bool _obsecure = false;
  bool get obsecure => _obsecure;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final formKey = GlobalKey<FormState>();
  dynamic get formkey => formKey;

  setLoading(value) {
    _loading = value;
    notifyListeners();
  }

  setobsecure(value) {
    _obsecure = value;
    notifyListeners();
  }

// ******** login function**************
  void signIn(String email, String password, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Utils().toastmsj("Login Successfull"),
                setLoading(false),
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const BottomNavigationW()),
                    ((route) => false)),
              })
          .catchError((e) {
        setLoading(false);
        Utils().toastmsj(e.toString());
      });
    }
  }
}
