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
      );
}
