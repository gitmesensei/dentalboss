import 'dart:async';

import 'package:dentalboss/carousel.dart';
import 'package:dentalboss/responsive_widget.dart';
import 'package:dentalboss/slideshow.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'dentalbosstheme.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  AnimationController _animationController;
  Animation _animation;
  Animation _animation2;
  var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.ease));
  var tween2 = Tween(begin: Offset(0.0, 1.0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.ease));
  var color= Colors.white;

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 2500), vsync: this);
    _animation = Tween(begin: 1.0, end: 0.0).animate(_animationController);
    _animation2 = Tween(begin: 0.0, end: 1.0).animate(_animationController);
    Timer(Duration(milliseconds: 1500),(){
      setState(() {
        color = Colors.black54;
      });
    });
    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                color: Colors.black,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Our physician follow COVID-19 protocol provided by mohfw.gov.in and sanitises each equipment before any procedure. Wearing mask is mandatory for both physcian and patient.',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              ResponsiveWidget.isLargeScreen(context)?  Padding(
                padding: const EdgeInsets.only(left: 8,right: 8,top: 20,bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonTheme(
                      minWidth: 40,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          elevation: 5.0,
                          splashColor: Colors.white,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.call,
                                  color: Colors.white,
                                  size: 22,
                                ),
                                Text(
                                  " +91 9718984202",
                                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                                ),
                              ],
                            ),
                          ),
                          color: DentalBossTheme.buildLightTheme().primaryColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    ButtonTheme(
                      minWidth: 40,
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                          elevation: 5.0,
                          splashColor: Colors.white,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Book an Appointment",
                              style: TextStyle(color: Colors.white, fontSize: 18.0),
                            ),
                          ),
                          color: DentalBossTheme.buildLightTheme().primaryColor),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                )):Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8,top: 20,),
                  child: Center(
                    child: Column(
                      children: [
                        ButtonTheme(
                          minWidth: 40,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              elevation: 5.0,
                              splashColor: Colors.white,
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                      size: 22,
                                    ),
                                    Text(
                                      " +91 9718984202",
                                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                                    ),
                                  ],
                                ),
                              ),
                              color: DentalBossTheme.buildLightTheme().primaryColor),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ButtonTheme(
                          minWidth: 40,
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              elevation: 5.0,
                              splashColor: Colors.white,
                              onPressed: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "Book an Appointment",
                                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                                ),
                              ),
                              color: DentalBossTheme.buildLightTheme().primaryColor),
                        ),
                      ],
                    ),
                  ),
                ),
              Container(
                height: ResponsiveWidget.isLargeScreen(context)? 550:300,
                width: size.width,
               child: SlideShow(),
              )
            ],

          ),
          SlideTransition(
            position: _animation.drive(tween),
            child: Container(
              color: Colors.black,
              height: ResponsiveWidget.isLargeScreen(context)? 650:500,
              width: double.infinity,
            ),
          ),
        ],
      ),
    );
  }

}
