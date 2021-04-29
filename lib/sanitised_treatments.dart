import 'package:dentalboss/responsive_widget.dart';
import 'package:flutter/material.dart';

class SanitisedAndSecured extends StatefulWidget {
  @override
  _SanitisedAndSecuredState createState() => _SanitisedAndSecuredState();
}

class _SanitisedAndSecuredState extends State<SanitisedAndSecured> {

  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0,-20,0);

  List<bool> _hovering = [
    false,
    false,
    false,
  ];

  final List<String> _listImage = [
    'assets/safety/1.png',
    'assets/safety/2.png',
    'assets/safety/3.png',

  ];

  final List<String> _listName=[
    'Open For Service',
    'Be Cautious',
    'Be Safe',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18,top: 40,bottom: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: ResponsiveWidget.isLargeScreen(context)? Text(
                  'Sanitised and Secured Care',

                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black54,
                      fontSize: 28,
                      letterSpacing: 1
                  ),
                ):Text(
                  'Sanitised and Secured Care',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.black54,
                      fontSize: 22,
                      letterSpacing: 1
                  ),
                ),
              ),
            ),
          ),

          ResponsiveWidget.isLargeScreen(context)?  Wrap(
            alignment: WrapAlignment.center,
            children:  List.generate(
                _listImage.length,
                    (index) => Container(
                      color: Colors.white,
                        child: buildItems(index))),
          ): Container(
            height: 350,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    color: Colors.white,
                    child: buildItems(index),
                  );

                }),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }
  Widget buildItems(index){
    return InkWell(
      onTap: (){},
      child: MouseRegion(
        onEnter: (value){
          setState(() {
            _hovering[index] = true;
          });
        },
        onExit: (value){
          setState(() {
            _hovering[index] = false;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          transform: _hovering[index]?hoverTransform:nonHoverTransform,
          width:ResponsiveWidget.isLargeScreen(context)? 300:220,
          height:ResponsiveWidget.isLargeScreen(context)? 420:300,
          padding: EdgeInsets.all(10),
          margin:EdgeInsets.all(20),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(_listImage[index]),fit: BoxFit.cover),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                offset: Offset(2, 2),
                blurRadius: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
