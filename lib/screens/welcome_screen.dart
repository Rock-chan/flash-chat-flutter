import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat/components/rounded_button.dart';
import 'package:flash_chat/screens/login_screen.dart';
import 'package:flash_chat/screens/registration_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      upperBound: 1.0,
    );

    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(controller);

    controller.forward();

    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                TypewriterAnimatedTextKit(
                  text: ['Flash Chat'],
                  textStyle: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.black,
                  ),
                  speed: Duration(milliseconds: 200),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              buttonText: 'Log In',
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
              color: Colors.lightBlueAccent,
            ),
            RoundedButton(
              buttonText: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
              color: Colors.blueAccent,
            ),
          ],
        ),
      ),
      // body: FutureBuilder(
      //   future: _initializeFirebase(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       print("11111");
      //       return Padding(
      //         padding: EdgeInsets.symmetric(horizontal: 24.0),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: <Widget>[
      //             Row(
      //               children: <Widget>[
      //                 Hero(
      //                   tag: 'logo',
      //                   child: Container(
      //                     child: Image.asset('images/logo.png'),
      //                     height: 60.0,
      //                   ),
      //                 ),
      //                 TypewriterAnimatedTextKit(
      //                   text: ['Flash Chat'],
      //                   textStyle: TextStyle(
      //                     fontSize: 40.0,
      //                     fontWeight: FontWeight.w900,
      //                     color: Colors.black,
      //                   ),
      //                   speed: Duration(milliseconds: 200),
      //                 ),
      //               ],
      //             ),
      //             SizedBox(
      //               height: 48.0,
      //             ),
      //             RoundedButton(
      //               buttonText: 'Log In',
      //               onPressed: () {
      //                 Navigator.pushNamed(context, LoginScreen.id);
      //               },
      //               color: Colors.lightBlueAccent,
      //             ),
      //             RoundedButton(
      //               buttonText: 'Register',
      //               onPressed: () {
      //                 Navigator.pushNamed(context, RegistrationScreen.id);
      //               },
      //               color: Colors.blueAccent,
      //             ),
      //           ],
      //         ),
      //       );
      //     }
      //     return Text('Loading');
      //   },
      // ),
    );
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
}
