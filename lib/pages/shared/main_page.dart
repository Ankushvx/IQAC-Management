import 'package:flutter/material.dart';
import 'package:portfilioapp/pages/Home/attendance.dart';
import 'package:portfilioapp/pages/Home/home.dart';
import 'package:portfilioapp/pages/Home/login.dart';
import 'package:portfilioapp/pages/Home/user.dart';
import 'themes.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  //final String title;
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const LoginPage(),
    const HomePage(),
    const UserPage(),
    const AttendancePage()
  ];
  int currentindex = 0;
  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    /// const color = Colors.black;
    final theme = Theme.of(context);
    return Scaffold(
      //backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Flutter",
          style: TextStyle(color: theme.canvasColor),
        ),
        actions: [
          IconButton(
              onPressed: () {
                currentTheme.toggleTheme();
              },
              icon: Icon(Icons.brightness_2_outlined))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            //       // ignore: sort_child_properties_last
            const SizedBox(
              width: double.infinity,
              child: DrawerHeader(
                decoration: BoxDecoration(color: Colors.teal),
                child: Text(
                  'Side Menu',
                  style: TextStyle(
                      color: Colors.white,
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
                    color: Colors.cyan,
                  ),
                  title: const Text("Welcome",
                      selectionColor: Colors.teal,
                      style: TextStyle(fontSize: 20, color: Colors.teal)),
                  //  tileColor: Colors.cyan,
                  onTap: () {
                    //Navigator.pop(context);
                  },
                ),
              );
            }),
            Container(
              width: double.infinity,
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Column(
                  children: [
                    Divider(
                      color: Colors.cyanAccent,
                    ),
                    ListTile(
                      title: const Text("Logout",
                          style: TextStyle(fontSize: 20, color: Colors.cyan)),

                      leading: const Icon(
                        Icons.exit_to_app,
                        color: Colors.cyan,
                      ),
                      //  tileColor: Colors.cyan,
                      onTap: () {
                        //Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: const Icon(Icons.),
                      title: const Text(
                        "Welcome",
                        //   style: TextStyle(fontSize: 20, color: Colors.white)
                      ),
                      // tileColor: Colors.cyan,
                      onTap: () {
                        //Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 13,
          selectedFontSize: 13,
          //   fixedColor: Colors.black45,
          type: BottomNavigationBarType.fixed,
          // backgroundColor: Colors.teal,
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.cyan,
          unselectedItemColor: Colors.cyan.withOpacity(0.6),
          showUnselectedLabels: true,
          showSelectedLabels: true,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                tooltip: "Menu", label: "Menu", icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                tooltip: "Home", label: "Home", icon: Icon(Icons.apps)),
            BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            BottomNavigationBarItem(label: "User", icon: Icon(Icons.person))
          ]),
    );
  }
}
