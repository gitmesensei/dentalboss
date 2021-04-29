import 'package:carousel_slider/carousel_slider.dart';
import 'package:dentalboss/responsive_widget.dart';
import 'package:dentalboss/size_config.dart';
import 'package:flutter/material.dart';

class SlideShow extends StatefulWidget {
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {

  int _current = 0;

  final List<String> _list = [
    'assets/carousel/1.png',
    'assets/carousel/2.png',
    'assets/carousel/3.png',
    'assets/carousel/4.png',
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _list.forEach((imageUrl) {
        precacheImage(AssetImage(imageUrl), context);
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SizeConfig().init(context);
        return CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1.0,
            autoPlay: true,
            aspectRatio: 2,
            enlargeCenterPage: false,
            scrollPhysics: NeverScrollableScrollPhysics(),
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
            // autoPlay: false,
          ),
          items: _list.map((item) => Container(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(item),fit: BoxFit.fitHeight)
              ),
            )
          )).toList(),
        );
  }
}