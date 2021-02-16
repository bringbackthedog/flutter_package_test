library my_auth_package;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Implement this on LoginView and RegisterView.
///
/// Ensures the login/register methods can be constructed through this function.
mixin AuthView {
  Widget createView(Function toggleShowLogin);
}

class MyWidgetTree extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final AuthView loginView, registerView;
  final Widget child;

  Stream<User> get _authStatus => _auth.authStateChanges();

  MyWidgetTree({
    /// The login view to be displayed to existing users
    @required this.loginView,

    /// The register view to be displayed to new users
    @required this.registerView,

    /// The widget to render once the authentication is completed
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: _authStatus,
      builder: (context, _) {
        User firebaseUser = Provider.of<User>(context);

        if (firebaseUser == null)
          return Authenticate(loginView: loginView, registerView: registerView);

        return child;
      },
    );
  }
}

/// AUTHENTICATE
class Authenticate extends StatefulWidget {
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
      // Show login view
      return widget.loginView.createView(toggleLoginRegister);
    } else {
      // Show Register view
      return widget.registerView.createView(toggleLoginRegister);
    }
  }
}
