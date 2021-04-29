import 'package:dentalboss/responsive_widget.dart';
import 'package:flutter/material.dart';


class OurServices extends StatefulWidget {
  @override
  _OurServicesState createState() => _OurServicesState();
}

class _OurServicesState extends State<OurServices> {
  int selectedIndex = 0;
  int hoverIndex = 0;
  final nonHoverTransform = Matrix4.identity();
  final hoverTransform = Matrix4.identity()..translate(0,-10,0);

  List<bool> _hovering = [
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  final List<String> _list = [
    'assets/treatments/filling.jpeg',
    'assets/treatments/rootcanal.jpeg',
    'assets/treatments/braces.jpeg',
    'assets/treatments/bridge.jpeg',
    'assets/treatments/dentures.jpeg',
    'assets/treatments/impants.jpeg',
    'assets/treatments/wisdom.jpeg',
    'assets/treatments/kids.jpeg',
    'assets/treatments/whitening.jpeg',
    'assets/treatments/makeover.jpeg',
    'assets/treatments/ulcers.jpeg',

  ];

  final List<String> _listName=[
    'Fillings',
    'RootCanal',
    'Braces & Aligners',
    'Bridges & Crowns',
    'Dentures',
    'Implants',
    'Wisdom Removal',
    'Kids Dentistry',
    'Whitening',
    'Smile Makeover',
    'Ulcers'
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
                 'Our Services & Treatments',

                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                    fontSize: 28,
                    letterSpacing: 1
                  ),
                ):Text(
                  'Our Services & Treatments',
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
                _list.length,
                    (index) => buildItems(index)),
          ): Container(
            height: 280,
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 11,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context,int index){
                  return Container(
                    child: buildItems(index),
                  );

                }),
          ),

        ],
      ),
    );
  }

 Widget buildItems(index){

    return  Container(
      color: Colors.white,
      child: InkWell(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  transform: _hovering[index]?hoverTransform:nonHoverTransform,
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.6),
                          offset: Offset(2, 2),
                          blurRadius: 8,
                        ),
                      ],
                      // border: Border.all(color: Colors.cyanAccent,width: 2),
                      image: DecorationImage(image: AssetImage(_list[index]),fit: BoxFit.cover)
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(_listName[index],style: TextStyle(color:_hovering[index]?Colors.cyan:Colors.black,fontSize: 18,letterSpacing: 1,fontWeight: FontWeight.w500),),
              )
            ],
          ),
        ),
      ),
    );

  }
}
