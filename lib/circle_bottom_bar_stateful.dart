import 'package:circle_bottom_bar/circle_bottom_painter.dart';
import 'package:flutter/material.dart';

class CircleBottomBar extends StatefulWidget {
  const CircleBottomBar({
    Key? key,
    required this.initIndex,
    required this.onChanged,
    this.tabCurve = Curves.linearToEaseOut,
    this.iconCurve = Curves.bounceOut,
    this.tabDurationMillSec = 1000,
    this.iconDurationMillSec = 500,
    required this.activeIcons,
    required this.inactiveIcons,
    required this.height,
    required this.circleWidth,
    required this.color,
    this.padding = EdgeInsets.zero,
    this.cornerRadius = BorderRadius.zero,
    this.shadowColor = Colors.white,
    this.elevation = 0,
    this.gradient,
  })  : assert(circleWidth <= height, "circleWidth <= height"),
        assert(activeIcons.length == inactiveIcons.length, "activeIcons.length and inactiveIcons.length must same!"),
        assert(activeIcons.length > initIndex, "activeIcons.length > initIndex"),
        super(key: key);

  final double height;
  final double circleWidth;
  final Color color;
  final List<Widget> activeIcons;
  final List<Widget> inactiveIcons;
  final EdgeInsets padding;
  final BorderRadius cornerRadius;
  final Color shadowColor;
  final double elevation;
  final Gradient? gradient;

  final int initIndex;
  final Curve tabCurve;
  final Curve iconCurve;
  final int tabDurationMillSec;
  final int iconDurationMillSec;

  final Function(int v) onChanged;
  @override
  State<StatefulWidget> createState() => _CircleBottomBarState();
}

class _CircleBottomBarState extends State<CircleBottomBar> with TickerProviderStateMixin {
  late AnimationController tabAc = AnimationController(vsync: this, duration: Duration(milliseconds: widget.tabDurationMillSec))
    ..addListener(() => setState(() {}))
    ..value = getPosition(widget.initIndex);

  late AnimationController activeIconAc = AnimationController(vsync: this, duration: Duration(milliseconds: widget.iconDurationMillSec))
    ..addListener(() => setState(() {}))
    ..value = 1;

  late int _index = widget.initIndex;
  int get index => _index;
  set index(int v) {
    _index = v;
    tabAc.stop();
    tabAc.animateTo(getPosition(v), curve: widget.tabCurve);
    activeIconAc.reset();
    activeIconAc.animateTo(1, curve: widget.iconCurve);

    widget.onChanged(v);
    setState(() {});
  }

  double getPosition(int i) {
    int itemCnt = widget.activeIcons.length;
    return i / itemCnt + (1 / itemCnt) / 2;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      margin: widget.padding,
      width: double.infinity,
      height: widget.height,
      child: Column(
        children: [
          CustomPaint(
            child: Container(
              height: widget.height,
              width: double.infinity,
              child: Stack(
                children: [
                  Row(
                    children: widget.inactiveIcons.map((e) {
                      int currentIndex = widget.inactiveIcons.indexOf(e);
                      return Expanded(
                          child: GestureDetector(
                        onTap: () => index = currentIndex,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          child: index == currentIndex ? null : e,
                        ),
                      ));
                    }).toList(),
                  ),
                  Positioned(
                      left: tabAc.value * deviceWidth - widget.circleWidth / 2 - tabAc.value * (widget.padding.left + widget.padding.right),
                      child: Transform.scale(
                        scale: activeIconAc.value,
                        child: Container(
                          width: widget.circleWidth,
                          height: widget.circleWidth,
                          transform: Matrix4.translationValues(0, -(widget.circleWidth * 0.5) + CircleBottomPainter.getMiniRadius(widget.circleWidth) - widget.circleWidth * 0.5 * (1 - activeIconAc.value), 0),
                          // color: Colors.amber,
                          child: widget.activeIcons[index],
                        ),
                      )),
                ],
              ),
            ),
            painter: CircleBottomPainter(
              iconWidth: widget.circleWidth,
              color: widget.color,
              xOffsetPercent: tabAc.value,
              boxRadius: widget.cornerRadius,
              shadowColor: widget.shadowColor,
              elevation: widget.elevation,
              gradient: widget.gradient,
            ),
          ),
        ],
      ),
    );
  }
}
