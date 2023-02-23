class BrandsModel {
  String? message;
  bool? isSuccess;
  Response? response;

  BrandsModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isSuccess = json['isSuccess'];
    response = Response.fromJson(json['response']);
  }
}

class Response {
  List<Brands>? brands;

  Response.fromJson(Map<String, dynamic> json) {
    brands = List.from(json['brands']).map((e) => Brands.fromJson(e)).toList();
  }
}

class Brands {
  int? id;
  String? brandName;
  Brands({required this.brandName,required this.id});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    brandName = json['brandName'];
  }
}
