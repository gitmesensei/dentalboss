import 'package:dentalboss/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:hovering/hovering.dart';


class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  Color textColor = Colors.grey;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return   Container(
      width: size.width,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: EdgeInsets.only(left: 50,top: 50,bottom: 20),
            child: ResponsiveWidget.isLargeScreen(context)?Row(
              children: [
                Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(child: Image.asset("assets/images/logo.gif"))),
                Text(
                  " DentalBoss".toUpperCase(),
                  style: Theme.of(context).textTheme.headline2.copyWith(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ): Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 80,
                    height: 80,
                    child: ClipOval(child: Image.asset("assets/images/logo.gif"))),
                SizedBox(height: 20,),
                Text(
                    "DentalBoss",
                    style: TextStyle(fontSize: 24,color: Colors.white,fontWeight: FontWeight.w700,letterSpacing: 2)
                ),
              ],
            ),
          ),
          Container(
            margin:ResponsiveWidget.isLargeScreen(context)? EdgeInsets.only(left: 150,bottom: 40):EdgeInsets.only(left: 50,bottom: 40),
            alignment: Alignment.topLeft,
            child: Text('Your Smile Partner',
              style: TextStyle(
                fontSize: 18,
                color:Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50),
            child: Divider(height: 0.3, color: Colors.white,),
          ),

          Container(
            width:size.width,
            height: 400,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 150,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 16),
                        child: Text('Follow',
                          style: TextStyle(
                              color: Colors.white,
                            fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('Facebook',style: TextStyle(
                            fontSize: 16
                              ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('Twitter',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('Instagram',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('LinkedIn',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(width: 50,),
                Container(
                  width: 150,
                  height: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 16),
                        child: Text('Company',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('About',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('Terms',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 25,top: 10),
                        child: HoverButton(
                          onpressed: () {  },
                          hoverTextColor: Colors.white,
                          textColor: Colors.grey,
                          child:Text('Privacy',style: TextStyle(
                              fontSize: 16
                          ),),
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 50,bottom: 0),
            alignment: Alignment.bottomLeft,
            child: Text('© 2021 DentalBoss',
              style: TextStyle(
                fontSize: 18,
                color:Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 50,right: 50,top: 0,bottom: 40),
            child: Divider(height: 0.3, color: Colors.white,),
          ),



        ],
      ),
    );
  }
}
