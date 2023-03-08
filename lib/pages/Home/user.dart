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
    final _theme = Theme.of(context);

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
    // final imageu = Image.network(
    //     'https://erp.subharti.org/${userModel.photo.replaceAll('~/', '')}');
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
              // image: DecorationImage(
              //   fit: BoxFit.fill,
              //   image: AssetImage('assets/images/drawerbg.avif'),
              // ),
              gradient: LinearGradient(
                colors: [Color(0xFF26A69A), Color(0xFF4DB6AC)],
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
                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      minRadius: 60.0,
                      child: CircleAvatar(
                        radius: 52.0,
                        child: ClipOval(
                          child: Image.network(
                              fit: BoxFit.scaleDown,
                              ApiConstants.IMAGEHOST +
                                  userModel.photo.replaceAll('~/', '')),
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
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    // color: Colors.white,
                  ),
                ),
                Text(
                  userModel.courseName,
                  style: const TextStyle(
                    //  color: Colors.white,
                    fontSize: 20,
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
                  // DateTime.parse(userModel.dateOfBirth).toString("dd-MM-yyyy"),
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
                  "Mobile No.",
                  style: TextStyle(
                      // color: Colors.indigoAccent,
                      //  fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  userModel.contactNo,
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
                  "Address",
                  style: TextStyle(
                      // color: Colors.indigoAccent,
                      //  fontWeight: FontWeight.normal,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
                subtitle: Text(
                  userModel.permAddress,
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
