import 'package:flutter/material.dart';

import '../../models/usermodel.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  UserModel? _userModel;
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    final userModel = _userModel!;
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1615716175455-9a098e2388be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2487&q=80'),
              ),
            ),
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 52.0,
                        child: ClipOval(
                          child: Image.network(fit: BoxFit.scaleDown, ''
                              // ApiConstants.IMAGEHOST +
                              //     userModel.photo.replaceAll('~/', ''),
                              ),
                        ),
                      ),
                    )
                    // const CircleAvatar(
                    //   backgroundColor: Colors.white70,
                    //   minRadius: 60.0,
                    //   child: CircleAvatar(
                    //       radius: 50.0,
                    //       backgroundImage: NetworkImage(
                    //         'https://images.unsplash.com/${userModel.studentName}',
                    //       ) //NetworkImage('${userModel.studentName}'),
                    //       ),
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userModel.studentName,
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
