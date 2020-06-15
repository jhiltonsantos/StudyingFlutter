import 'package:edge_alert/edge_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/button.dart';
import 'package:flash_chat/components/text_field_pages.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  String error;
  bool showSpin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF482588),
      body: ModalProgressHUD(
        inAsyncCall: showSpin,
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
                    child: Image.asset('images/iconsLogo.png', scale: 0.8),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextFieldEmail(
                hintText: 'Enter your email',
                color: Color(0xFF6fff6a),
                onChanged: (value) {
                  email = value;
                },
              ),
              SizedBox(
                height: 8.0,
              ),
              TextFieldPassword(
                hintText: 'Enter your password',
                color: Color(0xFF6fff6a),
                onChanged: (value) {
                  password = value;
                },
              ),
              SizedBox(
                height: 24.0,
              ),
              ButtonWelcome(
                text: 'Register',
                color: Color(0xFF6fff6a),
                onTap: () async {
                  setState(() {
                    showSpin = true;
                  });
                  try {
                    if (email != null && password != null) {
                      await _auth.createUserWithEmailAndPassword(
                          email: email, password: password);
//                      StatusAlert.show(
//                        context,
//                        duration: Duration(seconds: 1),
//                        title: 'Registered',
//                        configuration: IconConfiguration(icon: Icons.done),
//                      );
                      EdgeAlert.show(context,
                          title: 'Registered',
                          description: 'You Now Have Login Access',
                          gravity: EdgeAlert.TOP,
                          duration: 2,
                          backgroundColor: Color(0xFF882588),
                          icon: Icons.done);
                      Navigator.pop(context);
                    }
                    setState(() {
                      showSpin = false;
                    });
                  } catch (e) {
                    print(e);
                    setState(() {
                      showSpin = false;
                    });
                  }
                  EdgeAlert.show(context,
                      title: 'Error',
                      description: 'Try to Register Again',
                      gravity: EdgeAlert.TOP,
                      duration: 1,
                      backgroundColor: Colors.redAccent,
                      icon: Icons.error);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
