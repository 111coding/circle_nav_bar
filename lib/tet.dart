import 'package:circle_bottom_bar/circle_bottom_bar.dart';
import 'package:flutter/material.dart';

class Tet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CircleBottomBar(
        activeIcons: const [
          Icon(Icons.person, color: Colors.deepPurple),
          Icon(Icons.home, color: Colors.deepPurple),
          Icon(Icons.favorite, color: Colors.deepPurple),
        ],
        inactiveIcons: const [
          Text("My"),
          Text("Home"),
          Text("Like"),
        ],
        color: Colors.white,
        height: 60,
        circleWidth: 60,
        initIndex: 1,
        onChanged: (v) {
          // TODO
        },
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20),
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
          bottomRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
        ),
        shadowColor: Colors.deepPurple,
        elevation: 10,
        // gradient: LinearGradient(colors: [0xFF73d1d3, 0xFFBADCC3, 0xFFDBA380].map(Color.new).toList()),
      ),
    );
  }
}
