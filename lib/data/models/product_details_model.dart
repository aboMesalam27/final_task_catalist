class ProductDetailsModel {
  String? message;
  bool? isSuccess;
  Response? response;

  ProductDetailsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  List<Products>? products;

  Response.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }
}

class Products {
  int? id;
  String? productName;
  String? photoPath;
  int? brandID;
  String? brandName;
  String? sku;
  String? languageName;
  int? categoryID;
  String? categoryName;
  int? companyID;
  String? companyName;

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    photoPath = json['photoPath'];
    brandID = json['brandID'];
    brandName = json['brandName'];
    sku = json['sku'];
    languageName = json['languageName'];
    categoryID = json['categoryID'];
    categoryName = json['categoryName'];
    companyID = json['companyID'];
    companyName = json['companyName'];
  }

}
