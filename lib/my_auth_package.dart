library my_auth_package;

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

var x = MyWidgetTree();

class MyWidgetTree extends StatelessWidget {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  Stream get authStatus => _auth.authStateChanges();
  Widget loginView, registerView, loadingView;

  /// This function fetches the user's data in firestore once the user is logged
  /// in Firebase Auth.
  Function query;

  /// This is the custom templa
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
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider(
      create: (context) => MyAuthPackage.authStatus,
      builder: (context, child) {
        User firebaseUser = Provider.of<User>(context);

        if (firebaseUser == null) return Authenticate();
      },
    );
  }
}

///
/// AUTHENTICATE
///

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  void toggleLoginRegister() => setState(() => showLogin = !showLogin);

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return LoginView(
        //show Login View
        toggleLoginRegister: toggleLoginRegister,
      );
    } else {
      // show Register view
      return RegisterView(toggleLoginRegister: toggleLoginRegister);
    }
  }
}
