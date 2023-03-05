import 'package:flutter/material.dart';
import 'package:portfilioapp/pages/Home/attendance.dart';
import 'package:portfilioapp/pages/Home/home.dart';
import 'package:portfilioapp/pages/Home/login.dart';
import 'package:portfilioapp/pages/Home/user.dart';
import 'themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  final String title = "Hello";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentindex = 0;
  final PageController _pageController = PageController();

  void onTap(int index) {
    _pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.bounceInOut);
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(color: _theme.primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {
              currentTheme.toggleTheme();
            },
            icon: Icon(Icons.brightness_2_outlined),
          ),
        ],
      ),
      drawer: DrawerPage(),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
        controller: _pageController,
        children: const [LoginPage(), HomePage(), AttendancePage(), UserPage()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 13,
          selectedFontSize: 13,
          //   fixedColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.teal,
          onTap: onTap,
          currentIndex: currentindex,
          // selectedItemColor: Colors.indigo,
          // unselectedItemColor: Colors.indigo.withOpacity(0.5),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                tooltip: "Menu", label: "Menu", icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                tooltip: "Home", label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                tooltip: "Home",
                label: "Bar",
                icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(
                tooltip: "User", label: "User", icon: Icon(Icons.person))
          ]),
    );
  }
}

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          //       // ignore: sort_child_properties_last
          const SizedBox(
            width: double.infinity,
            child: DrawerHeader(
              // ignore: deprecated_member_use
              //  decoration: BoxDecoration(color: _theme.accentColor),
              child: Text(
                'Side Menu',
                style: TextStyle(
                    fontFamily: 'Loto',
                    //  color: Colors.white,
                    fontSize: 25,
                    overflow: TextOverflow.fade),
              ),
            ),
          ),
          Builder(builder: (context) {
            return Expanded(
              child: ListTile(
                leading: const Icon(
                  Icons.input,
                  // color: Colors.cyan,
                ),
                title: const Text("Welcome",
                    selectionColor: Colors.cyan,
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                      //color: Colors.cyan
                    )),
                //  tileColor: Colors.cyan,
                onTap: () {
                  //Navigator.pop(context);
                },
              ),
            );
          }),
          SizedBox(
            width: double.infinity,
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Column(
                children: [
                  const Divider(
                      //  color: Colors.cyanAccent,
                      ),
                  ListTile(
                    contentPadding: const EdgeInsetsDirectional.only(
                      start: 10.0,
                      bottom: 20.0,
                    ),
                    title: const Text("Logout",
                        style: TextStyle(
                          fontSize: 20,
                          //color: Colors.cyan
                        )),
                    leading: const Icon(
                      Icons.exit_to_app,
                      //  color: Colors.cyan,
                    ),
                    //  tileColor: Colors.cyan,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
