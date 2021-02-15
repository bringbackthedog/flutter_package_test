library my_auth_package;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  final Function toggleShowLogin;
  LoginView(this.toggleShowLogin);

  Widget createLogin(Function toggleShowLogin) => LoginView(toggleShowLogin);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class MyAuthPackage {
  // User _firebaseUser;
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Stream get authStatus => _auth.authStateChanges();

  Widget loginView, registerView, loadingView;

  MyAuthPackage({this.loadingView, this.loginView, this.registerView});
}

typedef FirestoreQuery = Future<DocumentSnapshot> Function(User);

class MyWidgetTree extends StatelessWidget {
  ///
  // TODO
  Widget Function(Function toggleShowLogin) createLoginView =
      LoginView(x).createLogin;

  ///

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

        if (firebaseUser == null) return Authenticate(createLoginView);

        return FutureProvider.value(
          value: query(firebaseUser),
          child: userTypeWrapper,
        );
      },
    );
  }
}

typedef loginView = Widget Function(Function);

// Widget Function(Function toggleShowLogin) createLoginView =
//     LoginView(x).createLogin;
///
/// AUTHENTICATE
///
class Authenticate extends StatefulWidget {
  // Widget loginView, registerView;
  final Widget Function(Function toggleShowLogin) createLoginView;
  Authenticate(this.createLoginView);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  void toggleLoginRegister() => setState(() => showLogin = !showLogin);

  // Widget Function(Function) createLoginView;
  // StatelessWidget loginView;

  // Widget x(Function) {
  //   return G();
  // }

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return widget.createLoginView(toggleLoginRegister); //(
      // //show Login View
      // toggleLoginRegister: toggleLoginRegister,
      // );
    } else {
      // show Register view
      return RegisterView(toggleLoginRegister: toggleLoginRegister);
    }
  }
}

// Widget myloginView = LoginView(x).createLogin();

// Widget createLogin(Function toggleShowLogin) => LoginView(toggleShowLogin);

// class SecondTest extends StatelessWidget {
//   Widget Function(Function) createLogin;
//   SecondTest(this.createLogin);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
