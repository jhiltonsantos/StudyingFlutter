import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/button.dart';
import 'package:flash_chat/components/text_field_pages.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF482588),
      body: ModalProgressHUD(
        inAsyncCall: showLoading,
        color: Color(0xFF882588),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 150.0,
                    child: Image.asset(
                      'images/iconsLogo.png',
                      scale: 0.8,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFieldEmail(
                hintText: 'Enter your email',
                color: Color(0xFF00f0d6),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFieldPassword(
                hintText: 'Enter your password',
                color: Color(0xFF00f0d6),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonWelcome(
                text: 'Log In',
                color: Color(0xFF00f0d6),
                onTap: () async {
                  setState(() {
                    showLoading = true;
                  });
                  try {
                    if (email != null && password != null) {
                      await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      Route routeChat = MaterialPageRoute(
                          builder: (context) => ChatScreen(
                                emailLogin: email,
                              ));
                      Navigator.push(context, routeChat);
                      EdgeAlert.show(context,
                          title: 'Login',
                          description: 'Log In $email',
                          gravity: EdgeAlert.TOP,
                          duration: 1,
                          backgroundColor: Color(0xFF882588),
                          icon: Icons.done);
                    }
                    setState(() {
                      showLoading = false;
                    });
                  } catch (e) {
                    print('ERROR: $e');
                    setState(() {
                      showLoading = false;
                    });
                  }
                  EdgeAlert.show(context,
                      title: 'Error',
                      description: 'Try to Login Again',
                      gravity: EdgeAlert.TOP,
                      duration: 1,
                      backgroundColor: Colors.redAccent,
                      icon: Icons.error);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
