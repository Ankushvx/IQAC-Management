class ApiResponse {
  String? successMessage;
  String? errorMessage;
  bool status;
  int code;
  dynamic data;

  ApiResponse({required this.successMessage, required this.errorMessage, required this.status, required this.code, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      successMessage: json['successMessage'],
      errorMessage: json['errorMessage'],
      status: json['status'],
      code: json['code'],
      data: json['data'],
    );
  }
}
