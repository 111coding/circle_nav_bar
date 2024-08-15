import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _tabIndex = 2;
  int get tabIndex => _tabIndex;
  set tabIndex(int v) {
    _tabIndex = v;
    setState(() {});
  }

  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: _tabIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIcons: const [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.face, color: Colors.white),
          Icon(Icons.account_balance_rounded, color: Colors.white)
        ],
        inactiveIcons: const [
          Icon(Icons.person, color: Colors.white),
          Icon(Icons.favorite, color: Colors.white),
          Icon(Icons.home, color: Colors.white),
          Icon(Icons.face, color: Colors.white),
          Icon(Icons.account_balance_rounded, color: Colors.white)
        ],
        levels: const ["Person", "Favorite", "Home", "Face", "Balance"],
        activeLevelsStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        inactiveLevelsStyle: const TextStyle(
          fontSize: 14,
          color: Colors.white70,
        ),
        // circleWidth: 60,
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        circleColor: Colors.purple,
        color: Colors.purple,
        tabCurve: Curves.decelerate,
        iconCurve: Easing.linear,
        tabDurationMillSec: 1500,
        iconDurationMillSec: 300,
        activeIndex: tabIndex,
        onTap: (index) {
          tabIndex = index;
          pageController.jumpToPage(tabIndex);
        },
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (v) {
          tabIndex = v;
        },
        children: const [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              "Screen 1",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              "Screen 2",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              "Screen 3",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              "Screen 4",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
                child: Text(
              "Screen 5",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
