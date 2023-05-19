import 'package:flutter/material.dart';
import 'package:portfilioapp/pages/Home/attendance.dart';
import 'package:portfilioapp/pages/Home/home.dart';
import 'package:portfilioapp/pages/Home/login.dart';
import 'package:portfilioapp/pages/Home/user.dart';
import '../../models/usermodel.dart';
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
            icon: const Icon(Icons.brightness_2_outlined),
          ),
        ],
      ),
      drawer: const DrawerPage(),
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
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1668587778654-e0babf8483b1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                fit: BoxFit.fill,
              ),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const SizedBox(
                  height: 20,
                ),
                const CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 38,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1573918651711-3b555ceac468?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2073&q=80"),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "Ankush Verma",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  "ankushkv2000@gmail.com",
                  style: TextStyle(
                    fontFamily: 'Raleway',
                    fontSize: 15,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          //       // ignore: sort_child_properties_last
          Builder(builder: (context) {
            return Expanded(
                child: ListView(
              padding: EdgeInsets.zero,
              children: [
                ListTile(
                  onTap: () {
                    setState(() {
                      Navigator.pop(context);
                    });
                  },
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
                ),
              ],

              // fit: BoxFit.fill,
              // image: NetworkImage(
              //   "https://images.unsplash.com/photo-1615716175455-9a098e2388be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2487&q=80",
              // ),
              //  ),
            ));
          }),
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
                  Navigator.pop(context);
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
