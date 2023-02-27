import 'package:flutter/material.dart';

import '../../constants/apiconstants.dart';
import '../../models/usermodel.dart';
import '../../utils/http_utils.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage>
    with AutomaticKeepAliveClientMixin<UserPage> {
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

  TableRow _createRow(String name, String value) {
    return TableRow(children: [
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              value,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),

      //     //TableCell(child: Text(name)),
      //     // TableCell(child: Text(value))
      //     // Padding(
      //     //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //     //   child: Builder(builder: (context) {
      //     //     return TableCell(verticalAlignment: null, child: Text(name));
      //     //   }),
      //     // ),
      //     // Padding(
      //     //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //     //   child: Builder(builder: (context) {
      //     //     return TableCell(
      //     //       verticalAlignment: null,
      //     //       child: Text(value),
      //     //     );
      //     //   }),
      //     // ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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

    return Scaffold(
      //     body: SingleChildScrollView(
      //       physics: const BouncingScrollPhysics(),
      //       padding: const EdgeInsets.all(15),
      //       child: Card(
      //         child: Table(
      //           textDirection: TextDirection.ltr,
      //           border: TableBorder.all(
      //             style: BorderStyle.solid,
      //             color: Colors.grey,
      //             borderRadius: BorderRadius.circular(10),
      //           ),
      //           children: [
      //             _createRow("Student Name", userModel.studentName),
      //             _createRow("Father's Name", userModel.fatherName),
      //             _createRow("Enrollment No.", userModel.enrollmentNo),
      //             _createRow("Gender", userModel.gender),
      //             _createRow("DOB", userModel.dateOfBirth),
      //           ],
      //         ),
      //       ),
      //     ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 0),
        physics: const BouncingScrollPhysics(),
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo, Color.fromARGB(255, 69, 89, 204)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.4, 0.8],
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage(
                            'https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
                      ),
                    ),
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
                Text(
                  userModel.courseName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              ListTile(
                // padding: const EdgeInsets.all(8.0),
                title: const Text(
                  "Enrollment No",
                  style: TextStyle(
                      //    color: Colors.indigoAccent,
                      //  fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  userModel.enrollmentNo,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                // padding: const EdgeInsets.all(8.0),
                title: const Text(
                  "Father Name",
                  style: TextStyle(
                      //color: Colors.indigoAccent,
                      fontFamily: 'Raleway',
                      //  fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  userModel.fatherName,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
          const Divider(),
          Column(
            children: [
              ListTile(
                // padding: const EdgeInsets.all(8.0),
                title: const Text(
                  "DOB",
                  style: TextStyle(
                      // color: Colors.indigoAccent,
                      //  fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  userModel.dateOfBirth,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ],
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
