import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  //int tabIndex = 0;
  @override
  Widget build(BuildContext context) {
    // ignore: sized_box_for_whitespace
    return const DefaultTabController(
      length: 5,
      //initialIndex: tabIndex,
      child: Scaffold(
        bottomNavigationBar: TabBar(
          labelColor: Colors.black38,
          tabs: [
            Padding(
              padding: EdgeInsets.only(top: 12, bottom: 20),
              child: IconButton(
                  onPressed: null,
                  hoverColor: Colors.redAccent,
                  focusColor: Colors.yellow,
                  icon: Icon(
                    Icons.accessibility_rounded,
                    semanticLabel: "User",
                  ),
                  tooltip: "User"),
            ),
            Padding(
                padding: EdgeInsets.only(top: 15, bottom: 20),
                child:
                    IconButton(onPressed: null, icon: Icon(Icons.book_rounded))

                //  Tab(icon: Icon(Icons.book_rounded)),
                ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Tab(icon: Icon(Icons.home)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Tab(icon: Icon(Icons.ac_unit_rounded)),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15, bottom: 20),
              child: Tab(
                icon: Icon(Icons.menu),
                // text: "Menu",
              ),
            ),
          ],
        ),
      ),
    );
    // );
  }
}
