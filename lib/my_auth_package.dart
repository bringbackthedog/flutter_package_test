library my_auth_package;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyAuthPackage {
  // User _firebaseUser;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream get authStatus => _auth.authStateChanges();

  Widget loginView, registerView, loadingView;

  MyAuthPackage({this.loadingView, this.loginView, this.registerView});
}

typedef FirestoreQuery = Future<DocumentSnapshot> Function(User);

class MyWidgetTree extends StatelessWidget {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get authStatus => _auth.authStateChanges();
  Widget loginView, registerView, loadingView, userTypeWrapper;

  /// This function fetches the user's data in firestore once the user is logged
  /// in Firebase Auth.
  FirestoreQuery query;

  /// This is the custom user template
  Widget customUserModel;

  /// This function will convert the Firebase User doc to the [customUserModel]
  /// provided.
  Function convertDocToCustomUserModel;

  MyWidgetTree({
    @required this.loadingView,
    @required this.loginView,
    @required this.registerView,
    @required this.query,
    @required this.customUserModel,
    @required this.convertDocToCustomUserModel,
    @required this.userTypeWrapper,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: MyAuthPackage.authStatus,
      builder: (context, child) {
        User firebaseUser = Provider.of<User>(context);

        if (firebaseUser == null) return Authenticate();

        return FutureProvider.value(
          value: query(firebaseUser),
          child: userTypeWrapper,
        );
      },
    );
  }
}

typedef loginView = Widget Function(Function);

///
/// AUTHENTICATE
///
class Authenticate extends StatefulWidget {
  // Widget loginView, registerView;
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  StatelessWidget loginView;

  bool showLogin = true;
  void toggleLoginRegister() => setState(() => showLogin = !showLogin);

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return loginView; //(
      // //show Login View
      // toggleLoginRegister: toggleLoginRegister,
      // );
    } else {
      // show Register view
      return RegisterView(toggleLoginRegister: toggleLoginRegister);
    }
  }
}
