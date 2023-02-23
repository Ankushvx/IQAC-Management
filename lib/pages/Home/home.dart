import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:portfilioapp/constants/apiconstants.dart';
import 'package:portfilioapp/models/eventmodel.dart';
import 'package:portfilioapp/models/usermodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<EventModel>? _eventModel = [];
  late List<UserModel>? _userModel = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _userModel = (await ApisService().getUser())!;
    Future.delayed(Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _userModel == null || _userModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _userModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(_userModel![index].studentID.toString()),
                          Text(_userModel![index].studentName)
                        ],
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text(_userModel![index].enrollmentNo.toString()),
                      //     Text(_userModel![index].fatherName)
                      //   ],
                      // )
                    ],
                  ),
                );
              }),
    );
  }
}

class ApisService {
  Future<List<UserModel>?> getUser() async {
    // try {
    // ignore: prefer_interpolation_to_compose_strings
    var url = Uri.parse(
        ApiConstants.baseURL + ApiConstants.userEndpoint + '?StudentId=22509');
    var url1 = Uri.parse(ApiConstants.baseURL + ApiConstants.getEventList);
    var response = await http.post(
      url,
      headers: {
        'accept': 'application/json',
        HttpHeaders.authorizationHeader:
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBTktVU0ggVkVSTUEiLCJlbWFpbCI6IiIsIlVzZXJJZCI6IjIyNTA5IiwiZXhwIjoxNjc2OTEyNjY1LCJpc3MiOiJUZXN0LmNvbSIsImF1ZCI6IlRlc3QuY29tIn0.05Kgf94KFpCTWKbuKw28510sFC_j168bo7BWBQ3DsRs',
      },
    );
    if (response.statusCode == 200) {
      List<UserModel> _model = userModelFromJson(response.body);
      return _model.toList();
    }
    // Uri.parse('http://192.168.60.7:93/api/v1/Common/ddlCollegeList'),
    // Uri.parse(
    //     'http://192.168.60.7:93/api/v1/Student/getStudentProfile?StudentId=22509'),
    // Send authorization headers to the backend.
    // headers: {
    //   HttpHeaders.authorizationHeader:
    //       'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJBTktVU0ggVkVSTUEiLCJlbWFpbCI6IiIsIlVzZXJJZCI6IjIyNTA5IiwiZXhwIjoxNjc2OTEyNjY1LCJpc3MiOiJUZXN0LmNvbSIsImF1ZCI6IlRlc3QuY29tIn0.05Kgf94KFpCTWKbuKw28510sFC_j168bo7BWBQ3DsRs',
    // },
    // );
    // print(response.body);
    // final parsed =
    //     json.decode(response.body)['data'].cast<Map<String, dynamic>>();
    // final responseJson = jsonDecode(response.body) as Map;
    // final data = parsed['data'] as Post;
    // return parsed.map<Post>((json) => Post.fromMap(json)).toList();
    //return data;
    // }
    // catch (x) {
    //   log(null) ;
    // }
  }
}
