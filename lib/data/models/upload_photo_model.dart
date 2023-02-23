class UploadPhotoModel {
  String? message;
  bool? isSuccess;
  Response? response;

  UploadPhotoModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  String? fullPath;

  Response.fromJson(Map<String, dynamic> json) {
    fullPath = json['fullPath'];
  }
}
