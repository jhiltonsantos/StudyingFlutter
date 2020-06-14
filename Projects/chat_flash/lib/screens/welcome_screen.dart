import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'login_screen.dart';
import 'registration_screen.dart';
import 'package:flash_chat/components/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_string';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  AnimationController controllerIcon;

  Animation animation;
  Animation animationButtonLogin;
  Animation animationButtonRegister;
  Animation animationIcon;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(milliseconds: 1500), vsync: this);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    animation = ColorTween(begin: Color(0xFF882588), end: Color(0xFF482588))
        .animate(controller);
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });


    controllerIcon =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    controllerIcon.forward();
    controllerIcon.addListener(() {
      setState(() {});
    });

    animationIcon =
        CurvedAnimation(parent: controllerIcon, curve: Curves.decelerate);
    animationIcon.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controllerIcon.reverse(from: 1.0);
      } else if (status == AnimationStatus.dismissed) {
        controllerIcon.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    controllerIcon.dispose();
    super.dispose();
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
              children: <Widget>[
                Hero(
                  flightShuttleBuilder: (
                    BuildContext flightContext,
                    Animation<double> animationIcon,
                    HeroFlightDirection flightDirection,
                    BuildContext fromHeroContext,
                    BuildContext toHeroContext,
                  ) {
                    final Hero toHero = toHeroContext.widget;
                    return RotationTransition(
                      turns: animationIcon,
                      child: toHero.child,
                    );
                  },
                  tag: 'logo',
                  child: Container(
                    child: Image(
                      image: AssetImage('images/logo.png'),
                      filterQuality: FilterQuality.low,
                      colorBlendMode: BlendMode.saturation,
                    ),
                    height: 70,
                  ),
                ),
                Center(
                  child: TypewriterAnimatedTextKit(
                    text: ['Chat App'],
                    repeatForever: true,
                    speed: Duration(milliseconds: 400),
                    textStyle: TextStyle(
                      color: Color(0xFFd3e9a9),
                      fontSize: 45.0,
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.center,
                    alignment: AlignmentDirectional.topStart,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonWelcome(
              text: 'Login',
              color: Color(0xFF00f0d6),
              onTap: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            ButtonWelcome(
              text: 'Register',
              color: Color(0xFF6fff6a),
              onTap: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}

