import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfilioapp/constants/apiconstants.dart';
import 'package:portfilioapp/models/eventmodel.dart';
import 'package:portfilioapp/models/usermodel.dart';
import 'package:portfilioapp/utils/http_utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin<HomePage> {
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
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
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
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
        ],
      ),

      //TableCell(child: Text(name)),
      // TableCell(child: Text(value))
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //   child: Builder(builder: (context) {
      //     return TableCell(verticalAlignment: null, child: Text(name));
      //   }),
      // ),
      // Padding(
      //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      //   child: Builder(builder: (context) {
      //     return TableCell(
      //       verticalAlignment: null,
      //       child: Text(value),
      //     );
      //   }),
      // ),
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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(15),
        child: Card(
          child: Table(
            textDirection: TextDirection.ltr,
            border: TableBorder.all(
              style: BorderStyle.solid,
              color: Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            children: [
              _createRow("Student Name", userModel.studentName),
              _createRow("Father's Name", userModel.fatherName),
              _createRow("Enrollment No.", userModel.enrollmentNo),
              _createRow("Gender", userModel.gender),
              _createRow("DOB", userModel.dateOfBirth),
            ],
          ),
        ),
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
