library my_auth_package;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef FirestoreQuery = Future<DocumentSnapshot> Function(User);

/// implement this on LoginView and RegisterView
mixin AuthView {
  Widget createView(Function toggleShowLogin);
}

class MyWidgetTree extends StatelessWidget {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  final AuthView loginView, registerView;
  final Widget loadingView, userTypeWrapper;

  /// This function fetches the user's data in firestore once the user is logged
  /// in Firebase Auth.
  final FirestoreQuery query; // TODO

  /// This is the custom user template
  final Widget customUserModel;

  /// This function will convert the Firebase User doc to the [customUserModel]
  /// provided.
  final Function convertDocToCustomUserModel;

  Stream<User> get authStatus => _auth.authStateChanges();

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
    return StreamProvider<User>.value(
      value: authStatus,
      builder: (context, child) {
        User firebaseUser = Provider.of<User>(context);

        if (firebaseUser == null)
          return Authenticate(loginView: loginView, registerView: registerView);

        return FutureProvider.value(
            value: query(firebaseUser), child: userTypeWrapper);
      },
    );
  }
}

///
/// AUTHENTICATE
///
class Authenticate extends StatefulWidget {
  // final Widget Function(Function toggleShowLogin) createLoginView;
  final AuthView loginView, registerView;
  Authenticate({
    @required this.loginView,
    @required this.registerView,
  });

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showLogin = true;
  void toggleLoginRegister() => setState(() => showLogin = !showLogin);

  @override
  Widget build(BuildContext context) {
    if (showLogin) {
      return widget.loginView.createView(toggleLoginRegister); //(
    } else {
      // show Register view
      return widget.registerView.createView(toggleLoginRegister);
    }
  }
}
