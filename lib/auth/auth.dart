import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:growpay/auth/login.dart';
import 'package:growpay/firebase_options.dart';
import 'package:growpay/home/home.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

class AuthService {
  handleAuth() {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }

  signIn(context, email, password) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((user) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
      print("signed in");
    }).catchError((onError) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Invalid Email or Passwod.")));
      print(onError);
    });
  }

  // signUp(email, password, name, phoneNumber) {
  //   FirebaseAuth.instance
  //       .createUserWithEmailAndPassword(email: email, password: password)
  //       .then((user) {
  //     FirebaseFirestore.instance
  //         .collection("Details")
  //         .doc(email)
  //         .collection("UserDetails")
  //         .add({
  //       'name': name,
  //       'phoneNumber': phoneNumber,
  //       'adminPanel': false,
  //       'email': email,
  //       'UID': FirebaseAuth.instance.currentUser.uid
  //     });
  //     print("signed up");
  //     FirebaseAuth.instance.currentUser.sendEmailVerification();
  //   }).catchError((onError) {
  //     print(onError);
  //   });
  // }

  signOut() {
    FirebaseAuth.instance.signOut();
  }
}
