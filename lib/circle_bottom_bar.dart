library circle_bottom_bar;

import 'package:flutter/material.dart';

class CircleBottomBar extends StatefulWidget {
  /// Construct a new appbar with internal style.
  ///
  /// ```dart
  /// CircleBottomBar(
  ///   activeIcons: const [
  ///     Icon(Icons.person, color: Colors.deepPurple),
  ///     Icon(Icons.home, color: Colors.deepPurple),
  ///     Icon(Icons.favorite, color: Colors.deepPurple),
  ///   ],
  ///   inactiveIcons: const [
  ///     Text("My"),
  ///     Text("Home"),
  ///     Text("Like"),
  ///   ],
  ///   color: Colors.white,
  ///   height: 60,
  ///   circleWidth: 60,
  ///   initIndex: 1,
  ///   onChanged: (v) {
  ///     // TODO
  ///   },
  ///   padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
  ///   cornerRadius: const BorderRadius.only(
  ///     topLeft: Radius.circular(8),
  ///     topRight: Radius.circular(8),
  ///     bottomRight: Radius.circular(24),
  ///     bottomLeft: Radius.circular(24),
  ///   ),
  ///   shadowColor: Colors.deepPurple,
  ///   elevation: 10,
  ///   // gradient: LinearGradient(colors: [0xFF73d1d3, 0xFFBADCC3, 0xFFDBA380].map(Color.new).toList()),
  /// );
  /// ```
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_bottom_bar/master/doc/value-512.png)
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
        assert(activeIcons.length == inactiveIcons.length, "activeIcons.length and inactiveIcons.length must be equal!"),
        assert(activeIcons.length > initIndex, "activeIcons.length > initIndex"),
        super(key: key);

  /// Bottom bar height (without bottom padding)
  final double height;

  /// Circle icon diameter
  final double circleWidth;

  /// Bottom bar Color
  ///
  /// If you set gradient, color will be ignored
  final Color color;

  /// Bottom bar activeIcon List
  ///
  /// The active icon must be smaller than the diameter of the circle
  ///
  /// activeIcons.length and inactiveIcons.length must be equal
  final List<Widget> activeIcons;

  /// Bottom bar inactiveIcon List
  ///
  /// The active icon must be smaller than the bottom bar height
  ///
  /// activeIcons.length and inactiveIcons.length must be equal
  final List<Widget> inactiveIcons;

  /// bottom bar padding
  ///
  /// It is the distance from the Scaffold
  final EdgeInsets padding;

  /// cornerRadius
  ///
  /// You can specify different values ​​for each corner
  final BorderRadius cornerRadius;

  /// shadowColor
  final Color shadowColor;

  /// elevation
  final double elevation;

  /// gradient
  ///
  /// If you set gradient, color will be ignored
  final Gradient? gradient;

  /// initial index value
  final int initIndex;

  /// When the circle icon moves left and right
  ///
  /// ![](https://raw.githubusercontent.com/111coding/circle_bottom_bar/master/doc/animation.gif)
  final Curve tabCurve;

  /// When the active icon moves up from the bottom
  ///
  /// /// ![](https://raw.githubusercontent.com/111coding/circle_bottom_bar/master/doc/animation.gif)
  final Curve iconCurve;

  /// When the circle icon moves left and right
  final int tabDurationMillSec;

  /// When the active icon moves up from the bottom
  final int iconDurationMillSec;

  /// If you tap other index, this function will bo called
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
            child: SizedBox(
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
                          transform: Matrix4.translationValues(0, -(widget.circleWidth * 0.5) + _CircleBottomPainter.getMiniRadius(widget.circleWidth) - widget.circleWidth * 0.5 * (1 - activeIconAc.value), 0),
                          // color: Colors.amber,
                          child: widget.activeIcons[index],
                        ),
                      )),
                ],
              ),
            ),
            painter: _CircleBottomPainter(
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

class _CircleBottomPainter extends CustomPainter {
  _CircleBottomPainter({
    required this.iconWidth,
    required this.color,
    required this.xOffsetPercent,
    required this.boxRadius,
    required this.shadowColor,
    required this.elevation,
    this.gradient,
  });

  final Color color;
  final double iconWidth;
  final double xOffsetPercent;
  final BorderRadius boxRadius;
  final Color shadowColor;
  final double elevation;
  final Gradient? gradient;

  static double getR(double circleWidth) {
    return circleWidth / 2 * 1.2;
  }

  static double getMiniRadius(double circleWidth) {
    return getR(circleWidth) * 0.3;
  }

  static double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();

    Paint paint = Paint();
    final w = size.width;
    final h = size.height;
    final r = getR(iconWidth);
    final miniRadius = getMiniRadius(iconWidth);
    final x = xOffsetPercent * w;
    final firstX = x - r;
    final secontX = x + r;

    // TopLeft Radius
    path.moveTo(0, 0 + boxRadius.topLeft.y);
    path.quadraticBezierTo(0, 0, boxRadius.topLeft.x, 0);
    path.lineTo(firstX - miniRadius, 0);
    path.quadraticBezierTo(firstX, 0, firstX, miniRadius);

    path.arcToPoint(
      Offset(secontX, miniRadius),
      radius: Radius.circular(r),
      clockwise: false,
    );

    path.quadraticBezierTo(secontX, 0, secontX + miniRadius, 0);

    // TopRight Radius
    path.lineTo(w - boxRadius.topRight.x, 0);
    path.quadraticBezierTo(w, 0, w, boxRadius.topRight.y);

    // BottomRight Radius
    path.lineTo(w, h - boxRadius.bottomRight.y);
    path.quadraticBezierTo(w, h, w - boxRadius.bottomRight.x, h);

    // BottomLeft Radius
    path.lineTo(boxRadius.bottomLeft.x, h);
    path.quadraticBezierTo(0, h, 0, h - boxRadius.bottomLeft.y);

    path.close();

    paint.color = color;

    if (gradient != null) {
      Rect shaderRect = Rect.fromCircle(center: Offset(w / 2, h / 2), radius: 180.0);
      paint.shader = gradient!.createShader(shaderRect);
    }

    // canvas.drawShadow(path, shadowColor, elevation, false);
    // Path oval = Path()..addOval(Rect.fromCircle(center: Offset(x, miniRadius), radius: iconWidth / 2));

    // canvas.drawShadow(oval, shadowColor, elevation, false);
    canvas.drawPath(
        path,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(elevation)));

    canvas.drawCircle(
        Offset(x, miniRadius),
        iconWidth / 2,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, convertRadiusToSigma(elevation)));

    canvas.drawPath(path, paint);

    canvas.drawCircle(Offset(x, miniRadius), iconWidth / 2, paint);
  }

  @override
  bool shouldRepaint(_CircleBottomPainter oldDelegate) => oldDelegate != this;
}
