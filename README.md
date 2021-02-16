# my_auth_package
A simple package to help with standart auth logic. 

_Work in Progress_

## Motivation
The authentication process is often the same between projects. The goal is to save having to write the boilerplate code to create the widget tree and much of the auth logic.

## Objective
Automate the authentication process in a new Flutter project.  
The package will take the following arguments:
  - a `LoginView` widget
  - a `RegisterView` widget

The package will generate the auth part of the widget tree.

## Setup: 
- Add `implements AuthView` to the `LoginView` and `RegisterView`
- Add a `Function` parameter 

```dart
// loginView.dart
class LoginView extends StatefulWidget implements AuthView {  
  Function toggleLoginRegister;
  LoginView({this.toggleLoginRegister});
  Widget createView(Function toggleShowLogin) => LoginView(toggleLoginRegister: toggleShowLogin);  

  ...

}
```

e.g.: 

```dart
// main.dart
void main() async {  
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SwaleApp());
}

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: MyWidgetTree(
        loginView: LoginView(),
        registerView: SocialSignupView(),  
          
        /// The widget to return once the user is authenticated.
        child: ChildWidget(),
      ),
    );
  }
}
```


