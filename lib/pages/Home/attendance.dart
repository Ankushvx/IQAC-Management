import 'package:flutter/material.dart';
import 'package:portfilioapp/constants/apiconstants.dart';
import 'package:portfilioapp/models/eventmodel.dart';
import 'package:portfilioapp/utils/http_utils.dart';

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});
  @override
  State<AttendancePage> createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  List<EventModel>? _eventModels;
  bool _isLoading = false;
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _fetchAlbum();
  }

  void _fetchAlbum() {
    setState(() {
      _isLoading = true;
    });
    ApiConstant().fetchAlbum().then((value) {
      setState(() {
        _eventModels = value;
      });
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var eventModels = _eventModels!;
    return Scaffold(
      // ignore: sized_box_for_whitespace
      body: ListView.builder(
        itemBuilder: (context, int index) {
          return Card(
            child: ListTile(
              title: Text(eventModels[index].eventName),
            ),
          );
        },
        itemCount: eventModels.length,
      ),
    );
  }
}

class ApiConstant {
  Future<List<EventModel>?> fetchAlbum() async {
    final response = await HttpUtils.postRequest(url: ApiConstants.EVENT_LIST);

    if (response == null) {
      return null;
    }
    return (response.data as List).map((e) => EventModel.fromJson(e)).toList();
  }
}
