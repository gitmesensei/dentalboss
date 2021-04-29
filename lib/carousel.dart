import 'dart:math';

import 'package:flutter/material.dart';
int numItems = 4;
var onSelectCard = ValueNotifier<int>(0);
class RotationScene extends StatefulWidget {
  @override
  _RotationSceneState createState() => _RotationSceneState();
}

class _RotationSceneState extends State<RotationScene> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: MyScener(),
      ),
    );
  }
}

class CardData {
  Color color;
  double x, y, z, angle;
  final int idx;
  double alpha = 0;

  Color get lightColor {
    var val = HSVColor.fromColor(color);
    return val.withSaturation(.5).withValue(.8).toColor();
  }

  CardData(this.idx) {
    color = Colors.primaries[idx % Colors.primaries.length];
    x = 0;
    y = 0;
    z = 0;

  }

}

class MyScener extends StatefulWidget {
  @override
  _MyScenerState createState() => _MyScenerState();
}

class _MyScenerState extends State<MyScener> with TickerProviderStateMixin {
  AnimationController _scaleController;
  List<CardData> cardData = [];
  double radio = 200.0;
  double radioStep = 0;
  bool isMousePressed = false;
  double _dragX = 0;
  double selectedAngle = 0;

  final List<String> _list = [
    'assets/carousel/1.png',
    'assets/carousel/2.png',
    'assets/carousel/3.png',
    'assets/carousel/4.png',
  ];

  @override
  void initState() {
    cardData = List.generate(numItems, (index) => CardData(index)).toList();
    radioStep = (pi * 2) / numItems;

    _scaleController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _scaleController.addListener(() => setState(() {}));

    onSelectCard.addListener(() {
      var idx = onSelectCard.value;
      _dragX = 0;
      selectedAngle = -idx * radioStep;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var initAngleOffset = pi / 2 + (-_dragX * .006);
    initAngleOffset += selectedAngle;

    // process positions.
    for (var i = 0; i < cardData.length; ++i) {
      var c = cardData[i];
      double ang = initAngleOffset + c.idx * radioStep;
      c.angle = ang + pi / 2;
      c.x = cos(ang) * radio;
//      c.y = sin(ang) * 10;
      c.z = sin(ang) * radio;
    }

    // sort in Z axis.
    cardData.sort((a, b) => a.z.compareTo(b.z));

    var list = cardData.map((vo) {
      var c = addCard(vo);
      var mt2 = Matrix4.identity();
      mt2.setEntry(3, 2, 0.001);
      mt2.translate(vo.x, vo.y, -vo.z);
      mt2.rotateY(vo.angle + pi);
      c = Transform(
        alignment: Alignment.center,
        origin: Offset(0.0, -100 - _scaleController.value * 200.0),
        transform: mt2,
        child: c,
      );
      return c;
    }).toList();

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onPanDown: (e) {
        isMousePressed = true;
        setState(() {});
        _scaleController.animateTo(0,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
      },
      onPanUpdate: (e) {
        isMousePressed = false;
        _scaleController.animateTo(0,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
        _dragX += e.delta.dx;
        setState(() {});
      },
      onPanEnd: (e) {
        isMousePressed = false;
        _scaleController.animateTo(0,
            duration: Duration(seconds: 1),
            curve: Curves.fastLinearToSlowEaseIn);
        setState(() {});
      },
      child: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.center,
          children: list,
        ),
      ),
    );
  }

  Widget addCard(CardData vo) {
    var alpha = ((1 - vo.z / radio) / 2) * .6;
    Widget c;
    c = Container(
      margin: EdgeInsets.all(12),
      width: 400,
      height: 400,
      alignment: Alignment.center,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.black.withOpacity(alpha),
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(image: AssetImage(_list[vo.idx]),fit: BoxFit.cover),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.2 + alpha * .2),
              spreadRadius: 1,
              blurRadius: 12,
              offset: Offset(0, 2))
        ],
      ),
    );
    return c;
  }
}

