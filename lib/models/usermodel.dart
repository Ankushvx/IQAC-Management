import 'dart:convert';

List<UserModel> userModelFromJson(String str) =>
    List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));
String userModelToJson(List<UserModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserModel {
  int studentID;
  int regId;
  String studentName;
  String fatherName;
  String motherName;
  String enrollmentNo;
  String dateOfBirth;
  String gender;
  String categoryName;
  String permAddress;
  String contactNo;
  String semester;
  String photo;
  String specializationName;
  String courseName;
  String collegeName;
  DocumentModel documentDetails;

  UserModel({
    required this.studentID,
    required this.regId,
    required this.studentName,
    required this.fatherName,
    required this.motherName,
    required this.enrollmentNo,
    required this.dateOfBirth,
    required this.gender,
    required this.categoryName,
    required this.permAddress,
    required this.contactNo,
    required this.semester,
    required this.photo,
    required this.specializationName,
    required this.courseName,
    required this.collegeName,
    required this.documentDetails,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        studentID: json['studentID'],
        regId: json['regId'],
        studentName: json['studentName'],
        fatherName: json['fatherName'],
        motherName: json['motherName'],
        enrollmentNo: json['enrollmentNo'],
        dateOfBirth: json['dateOfBirth'],
        gender: json['gender'],
        categoryName: json['categoryName'],
        permAddress: json['permAddress'],
        contactNo: json['contactNo'],
        semester: json['semester'],
        photo: json['photo'],
        specializationName: json['specializationName'],
        courseName: json['courseName'],
        collegeName: json['collegeName'],
        documentDetails: DocumentModel.fromJson(json['documentDetails']),
      );
  Map<String, dynamic> toJson() => {
        "studentID": studentID,
        "regId": regId,
        "studentName": studentName,
        "fatherName": fatherName,
        "motherName": motherName,
        "enrollmentNo": enrollmentNo,
        "dateOfBirth": dateOfBirth,
        "gender": gender,
        "categoryName": categoryName,
        "permAddress": permAddress,
        "contactNo": contactNo,
        "semester": semester,
        "photo": photo,
        "specializationName": specializationName,
        "courseName": courseName,
        "collegeName": collegeName,
        "documentDetails": documentDetails.toJson(),
      };
}

class DocumentModel {
  String documentName;
  String docSerial;
  String issueddate;
  String issuedcollege;
  String isSubmitted;
  String docSubmittedType;
  String collectedby;
  String collectedDate;
  DocumentModel({
    required this.documentName,
    required this.docSerial,
    required this.issueddate,
    required this.issuedcollege,
    required this.isSubmitted,
    required this.docSubmittedType,
    required this.collectedby,
    required this.collectedDate,
  });
  factory DocumentModel.fromJson(Map<String, dynamic> json) => DocumentModel(
        documentName: json['documentName'],
        docSerial: json['docSerial'],
        issueddate: json['issueddate'],
        issuedcollege: json['issuedcollege'],
        isSubmitted: json['isSubmitted'],
        docSubmittedType: json['docSubmittedType'],
        collectedby: json['collectedby'],
        collectedDate: json['collectedDate'],
      );

  Map<String, dynamic> toJson() => {
        "documentName": documentName,
        "docSerial": docSerial,
        "issueddate": issueddate,
        "issuedcollege": issuedcollege,
        "isSubmitted": isSubmitted,
        "docSubmittedType": docSubmittedType,
        "collectedby": collectedby,
        "collectedDate": collectedDate,
      };
}
