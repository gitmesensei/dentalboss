import 'package:flutter/material.dart';

class MobileMenu extends StatefulWidget {
  @override
  _MobileMenuState createState() => _MobileMenuState();
}

class _MobileMenuState extends State<MobileMenu> {
  int selectedIndex = 0;
  List<String> menuItems = [
    "TREATMENTS",
    "PATIENT SAFETY",
    "DOCTORS",
    "FIND A CLINIC",
    "PRICING",
    "BOOK APPOINTMENT"
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children:  List.generate(
            menuItems.length,
                (index) => buildMenuItem(index)),
      ),
    );
  }
  Widget buildMenuItem(index) => InkWell(
    onTap: () {
      setState(() {
        selectedIndex = index;
      });
    },
    child: AnimatedContainer(
      width: double.maxFinite,
      height: 50,
      duration: Duration(milliseconds: 200),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Text(menuItems[index],
            style: TextStyle(fontSize: 14, color:Colors.black54,fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
