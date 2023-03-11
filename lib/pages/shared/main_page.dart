import 'package:flutter/material.dart';
import 'package:portfilioapp/pages/Home/attendance.dart';
import 'package:portfilioapp/pages/Home/home.dart';
import 'package:portfilioapp/pages/Home/login.dart';
import 'package:portfilioapp/pages/Home/user.dart';
import '../../constants/apiconstants.dart';
import '../../models/usermodel.dart';
import '../../utils/http_utils.dart';
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
      // drawer: const Drawer(
      //   child: DrawerPage(),
      // ),
      drawer: const DrawerPage(),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            currentindex = index;
          });
        },
        controller: _pageController,
        children: const [HomePage(), AttendancePage(), UserPage()],
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
            // BottomNavigationBarItem(
            //     tooltip: "Menu", label: "Menu", icon: Icon(Icons.menu)),
            BottomNavigationBarItem(
                tooltip: "Home", label: "Home", icon: Icon(Icons.home)),
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
  UserModel? _userModel;
  bool _isLoading = false;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() {
    setState(() {
      _isLoading = true;
    });

    ApisService().getUser().then((value) {
      setState(() {
        _userModel = value;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    // super.build(context);
    if (_isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (_userModel == null) {
      return const Center(
        child: Text(
          "Failed to load student details.",
        ),
      );
    }

    final userModel = _userModel!;
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              // image: DecorationImage(
              //     fit: BoxFit.fill,
              //     image: AssetImage('assets/images/drawerbg.avif')
              //     // NetworkImage(
              //     //   "https://images.unsplash.com/photo-1615716175455-9a098e2388be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2487&q=80",
              //     // ),
              //     ),
              gradient: LinearGradient(
                colors: [Color(0xFF26A69A), Color(0xFF4DB6AC)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.4, 0.8],
              ),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white70,
                  minRadius: 42,
                  child: CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                      ApiConstants.IMAGEHOST +
                          userModel.photo.replaceAll('~/', ''),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  userModel.studentName,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      //  color: Colors.white,
                      overflow: TextOverflow.fade),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  userModel.contactNo,
                  style: const TextStyle(
                    //  fontFamily: 'Loto',
                    fontWeight: FontWeight.bold,
                    //  color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ],
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

class ApisService {
  Future<UserModel?> getUser() async {
    var response = await HttpUtils.postRequest(
        url: ApiConstants.USER_PROFILE,
        queryParameters: {
          "StudentId": 22509,
        });

    if (response == null || response.data == null) {
      return null;
    }

    return UserModel.fromJson(response.data);
  }
}
