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
}
