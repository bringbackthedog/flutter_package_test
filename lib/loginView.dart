// import 'dart:developer';
// import 'dart:io';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:my_auth_package/my_auth_package.dart';
// import 'package:swale/services/auth.dart';
// import 'package:swale/shared/globals.dart';

// class LoginView extends StatefulWidget implements AuthView {
//   Function toggleLoginRegister;
//   LoginView({this.toggleLoginRegister});

//   Widget createView(Function toggleShowLogin) =>
//       LoginView(toggleLoginRegister: toggleShowLogin);

//   @override
//   _LoginViewState createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   AuthService _auth = AuthService.instance;
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
//     Orientation orientation = MediaQuery.of(context).orientation;
//     double aspectRatio = width / height;
//     // log("height: ${height.toString()}");
//     // log("width: ${width.toString()}");
//     // log("aspectRatio: ${aspectRatio.toString()}");
//     // log("devicePixelRatio: ${devicePixelRatio.toString()}");
//     // log("orientation: ${orientation.toString()}");
//     // log("height: ${AspectRatio(aspectRatio: ,)}");
//     return Scaffold(
//       // backgroundColor: Colors.red,
//       backgroundColor: SwaleColors.offWhite,
//       body: Stack(
//         children: [
//           // Background half circle
//           Positioned(
//             top: 0.15 * height,
//             left: width / 2, // middle of the screen width
//             child: CustomPaint(
//               size: Size(width, height),
//               painter: BgHalfCirclePainter(),
//             ),
//           ),

//           // FIRST BUBBLES ROW
//           Positioned(
//             top: 0.08 * height,
//             left: 0.0,
//             child: Container(
//               width: width * 0.136,
//               height: height * 0.072,
//               decoration: BoxDecoration(
//                 color: SwaleColors.turquoise,
//                 borderRadius: BorderRadius.only(
//                   bottomRight: Radius.circular(50.0),
//                   topRight: Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

// //
//           Positioned(
//             top: 0.08 * height,
//             left: 0.229 * width,
//             child: Container(
//               width: width * 0.1235,
//               height: width * 0.1235,
//               decoration: BoxDecoration(
//                 color: SwaleColors.turquoise,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 0.088 * height,
//             left: 0.462 * width,
//             child: Container(
//               width: width * 0.092,
//               height: width * 0.092,
//               decoration: BoxDecoration(
//                 color: SwaleColors.turquoise,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 0.0975 * height,
//             left: 0.690 * width,
//             child: Container(
//               width: width * 0.058,
//               height: width * 0.058,
//               decoration: BoxDecoration(
//                 color: SwaleColors.turquoise,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           // SECOND BUBBLES ROW

//           Positioned(
//             top: 0.2336 * height,
//             left: width * 0.422, // or use right?
//             child: Container(
//               width: width * 0.0785,
//               height: width * 0.0785,
//               decoration: BoxDecoration(
//                 color: SwaleColors.blue,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 0.226 * height,
//             left: width * 0.607, // or use right?
//             child: Container(
//               width: width * 0.108,
//               height: width * 0.108,
//               decoration: BoxDecoration(
//                 color: SwaleColors.blue,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           Positioned(
//             top: 0.226 * height,
//             left: width * 0.81, // or use right?
//             child: Container(
//               width: width * 0.19,
//               height: 0.0638 * height,
//               decoration: BoxDecoration(
//                 color: SwaleColors.blue,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50.0),
//                   topLeft: Radius.circular(50.0),
//                 ),
//               ),
//             ),
//           ),

//           // SWALE LOGO
//           Positioned(
//             top: 0.19 * height,
//             width: width,
//             height: 300, // scale image
//             child: Align(
//                 alignment: Alignment.center,
//                 child: Image.asset("assets/swaleLogos/SWALE_LOGO_WHITE.png")),
//           ),

//           // LOGIN BUTTONS

//           Positioned(
//             top: 0.642 * height,
//             width: width,
//             // height: 300, // scale image
//             height: 0.3576 * height,
//             child: Align(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 0.812 * width,
//                     height: 0.08 * height,
//                     child: ElevatedButton(
//                       onPressed: widget.toggleLoginRegister,
//                       child: Text(
//                         'CREATE AN ACCOUNT',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 17.0,
//                           letterSpacing: 1.5,
//                         ),
//                       ), // TRANSLATE
//                       style: ElevatedButton.styleFrom(
//                         primary: SwaleColors.blue,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     width: 0.812 * width,
//                     height: 0.08 * height,
//                     child: ElevatedButton(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/google_logo_ios.png',
//                             height: 40,
//                             width: 40,
//                           ),
//                           SizedBox(width: 12.0),
//                           Text(
//                             'SIGN IN WITH GOOGLE', // TODO: TRANSLATE
//                             style: TextStyle(
//                               color: SwaleColors.blue,
//                               fontSize: 17.0,
//                               letterSpacing: 1.5,
//                             ),
//                           ),
//                         ],
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         primary: Colors.white,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(12.0),
//                         ),
//                       ),
//                       onPressed: () async {
//                         UserCredential _userCredential =
//                             await _auth.signInWithGoogle();

//                         String email = _userCredential.user.email;
//                         log('User $email successfully logged in with Google');
//                       },
//                     ),
//                   ),
//                   Container(
//                     width: 0.812 * width,
//                     height: 0.08 * height,
//                     child: ElevatedButton(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Image.asset(
//                               "assets/f_logo_RGB-Blue_58.png",
//                               // height: buttonSize.height * 0.4,
//                               height: 30,
//                               width: 30,
//                             ), //facebook logo
//                             SizedBox(
//                               width: 12.0,
//                             ),
//                             Text(
//                               'SIGN IN WITH FACEBOOK', // TODO: TRANSLATE
//                               style: TextStyle(
//                                 color: SwaleColors.blue,
//                                 fontSize: 17.0,
//                                 letterSpacing: 1.5,
//                               ),
//                             ),
//                           ],
//                         ),
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12.0),
//                           ),
//                         ),
//                         onPressed: () async {
//                           try {
//                             UserCredential _userCredential =
//                                 await _auth.signInWithFacebook();
//                             log("user ${_userCredential.user?.displayName ?? "N/A"} succesfully signed in with Facebook");
//                           } catch (e) {
//                             log(e.toString());
//                           }
//                         }),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class BgHalfCirclePainter extends CustomPainter {
//   @override
//   void paint(Canvas canvas, Size size) {
//     canvas.drawArc(
//       Rect.fromCenter(
//         center: Offset.zero,
//         height: 600.0,
//         // width: 700.0,
//         width: size.width * 1.6,
//       ),
//       25,
//       125,
//       true,
//       Paint()..color = SwaleColors.darkBlue,
//     );
//   }

//   @override
//   bool shouldRepaint(BgHalfCirclePainter oldDelegate) => false;

//   @override
//   bool shouldRebuildSemantics(BgHalfCirclePainter oldDelegate) => false;
// }
