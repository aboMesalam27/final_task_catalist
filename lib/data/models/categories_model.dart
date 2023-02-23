class CategoriesModel {
  String? message;
  bool? isSuccess;
  Response? response;

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  List<Categories>? categories;

  Response.fromJson(Map<String, dynamic> json) {
    categories = List.from(json['categories'])
        .map((e) => Categories.fromJson(e))
        .toList();
  }
}

class Categories {
  int? id;
  String? planogramPhotoPath;
  String? categoryname;

  String? languageName;
  int? companyID;
  num? percentageNumber;
  String? createddate;
  bool? active;
  Categories({
    required this.id,
    required this.categoryname,
  });
  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    planogramPhotoPath = json['planogramPhotoPath'];
    categoryname = json['categoryname'];

    languageName = json['languageName'];
    companyID = json['companyID'];
    percentageNumber = json['percentageNumber'];
    createddate = json['createddate'];
    active = json['active'];
  }
}
