import 'dart:convert';

List<EventModel> eventModelFromJson(String str) =>
    List<EventModel>.from(json.decode(str).map((e) => EventModel.fromJson(e)));
String eventModelToJson(List<EventModel> data) =>
    json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

class EventModel {
  String eventName;
  String filePath;

  EventModel({
    required this.eventName,
    required this.filePath,
  });
  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
        eventName: json['eventName'],
        filePath: json['filePath'],
      );
  Map<String, dynamic> toJson() => {
        "eventName": eventName,
        "filePath": filePath,
      };
}
