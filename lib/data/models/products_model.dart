class ProductsModel {
  String? message;
  bool? isSuccess;
  Response? response;

  ProductsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  List<Product>? products;

  Response.fromJson(Map<String, dynamic> json) {
    products =
        List.from(json['products']).map((e) => Product.fromJson(e)).toList();
  }
}

class Product {
  int? id;
  String? productName;
  String? photoPath;
  String? brandID;
  String? brandName;
  String? sku;
  String? languageName;
  String? categoryID;
  String? categoryName;
  int? companyID;
  String? companyName;
  Product({
    required this.categoryID,
    required this.brandID,
    required this.productName,
    required this.sku,
  });

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['productName'];
    photoPath = json['photoPath'];
    brandID = json['brandID'].toString();
    brandName = json['brandName'];
    sku = json['sku'];
    languageName = json['languageName'];
    categoryID = json['categoryID'].toString();
    categoryName = json['categoryName'];
    companyID = json['companyID'];
    companyName = json['companyName'];
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "productName": productName,
        "photoPath": photoPath,
        // "brandID": brandID,
       // "brandName": brandName,
        // "sku": sku,
        //"languageName": languageName,
       // "categoryID": categoryID,
       // "categoryName": categoryName,
        //"companyID": companyID,
        //"companyName": companyName,
      };
}
