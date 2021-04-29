
import 'package:dentalboss/company_screen.dart';
import 'package:dentalboss/dentalbosstheme.dart';
import 'package:dentalboss/homepage.dart';
import 'package:dentalboss/menu.dart';
import 'package:dentalboss/mobile_menu.dart';
import 'package:dentalboss/responsive_widget.dart';
import 'package:dentalboss/sanitised_treatments.dart';
import 'package:dentalboss/services.dart';
import 'package:dentalboss/size_config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  bool _tapped= false;
  AnimationController _animationController;
  Animation _animation;
  var tween = Tween(begin: Offset(0.0, -1.0), end: Offset.zero)
      .chain(CurveTween(curve: Curves.ease));

  @override
  void initState() {
    _animationController = AnimationController(
        duration: Duration(milliseconds: 500), vsync: this);
    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: DentalBossTheme.buildLightTheme().backgroundColor,
      child: SafeArea(
          child: Scaffold(
        backgroundColor: DentalBossTheme.buildLightTheme().backgroundColor,
        body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                ResponsiveWidget.isLargeScreen(context)
                    ? SliverAppBar(
                        expandedHeight: 100,
                        collapsedHeight: 100,
                        floating: true,
                        automaticallyImplyLeading: false,
                        snap: true,
                        elevation: 0,
                        shadowColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        pinned: true,
                        flexibleSpace: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: <BoxShadow>[
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: Offset(2, 2),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: getAppBar(),
                        ))
                    : SliverAppBar(
                        floating: true,
                        pinned: true,
                        snap: false,
                        backgroundColor: Colors.white,
                        expandedHeight: 65,
                        automaticallyImplyLeading: false,
                        collapsedHeight: 65,
                        leading:_tapped==false?IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.menu,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _tapped=true;
                                _animationController.forward();
                              });
                            }):IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            icon: Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _tapped=false;
                                _animationController.reverse();
                              });
                            }),
                        flexibleSpace: Container(
                          margin: EdgeInsets.only(top: 8, left: 35),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Text('DENTALBOSS',
                                  style: GoogleFonts.yesevaOne(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: DentalBossTheme.buildLightTheme()
                                          .primaryColor,
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      )
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                children: [
                  ResponsiveWidget.isLargeScreen(context) ? SizedBox(width: 1,):
                 _tapped? SlideTransition(
                      position: _animation.drive(tween),
                      child: MobileMenu()):SizedBox(width: 1,),
                  HomePage(),
                  OurServices(),
                  SanitisedAndSecured(),
                  CompanyPage(),
                ],
              ),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: ResponsiveWidget.isLargeScreen(context)
            ? null
            : Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.pinkAccent),
                        child: IconButton(
                            splashColor: Colors.white,
                            icon: Icon(
                              Icons.assignment,
                              color: Colors.white,
                            ),
                            onPressed: () {}),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.purpleAccent),
                        child: IconButton(
                            splashColor: Colors.white,
                            icon: Icon(
                              Icons.chat,
                              color: Colors.white,
                            ),
                            onPressed:(){
                              _launchWhatsapp("+919718984202");
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.lightGreen),
                        child: IconButton(
                            splashColor: Colors.white,
                            icon: Icon(
                              Icons.call,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _launchCall("+919718984202");
                            }),
                      ),
                    ),
                  ],
                ),
              ),
      )),
    );
  }

  Widget getAppBar() {
    return Row(
      children: [
        Container(
          color: Colors.white,
          child: InkWell(
            onTap: () {},
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/logo.gif',
                        fit: BoxFit.cover,
                      ),
                    )),
                Text(' DENTALBOSS',
                    style: GoogleFonts.yesevaOne(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: DentalBossTheme.buildLightTheme().primaryColor,
                        letterSpacing: 2,
                        fontSize: 22,
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
        ),
        Menu(),
      ],
    );
  }
  _launchWhatsapp(number) async{

    var whatsappurl="whatsapp://send?phone=$number";

    await canLaunch(whatsappurl)?launch(whatsappurl):throw('could not find whatsapp account for the number');

  }
  _launchCall(number) async{

    var callUrl="tel:$number";

    await canLaunch(callUrl)?launch(callUrl):throw('could not find the number');

  }
}
