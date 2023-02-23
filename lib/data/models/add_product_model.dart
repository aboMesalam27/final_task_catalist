class AddProductModel {
  String? message;
  bool? isSuccess;
  int? response;

  AddProductModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = json['response'];
  }
}
