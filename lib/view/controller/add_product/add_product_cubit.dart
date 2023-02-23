import 'package:dio/dio.dart';

import 'index_add_product.dart';

class AddProductCubit extends Cubit<AddProductStates> {
  AddProductCubit() : super(AddProductInitialState());
  static AddProductCubit get(context) => BlocProvider.of(context);
  // AddProductModel? addProductModel;

  List<Product>? productList = [];
  bool withInternet = false;
  String? message;
  Future<String> addProduct({
    required String productName,
    required String productId,
    required String sukName,
    required String categoryID,
    required String brandID,
    required BuildContext context,
    required XFile file,
  }) async {
    withInternet = await InternetCubit.get(context).checkConnection();

    if (withInternet) {
      if (kDebugMode) {}
      emit(AddProductLoadingState());
      String photoPath = await uploadImage(file, productId);
      DioHelper.postData(
        url: EndPoints.ADD_PRODUCT,
        data: {
          "productName": productName,
          "sku": sukName,
          "categoryID": categoryID,
          "brandID": brandID,
          "photoPath": photoPath
        },
        token: CacheHelper.getData(key: 'token'),
      ).then((value) {
        message = value.data['message'];
        //addProductModel = AddProductModel.fromJson(value.data);
        emit(AddProductSuccessState());
      }).catchError((error) {});
    } else {
      if (kDebugMode) {
        if (kDebugMode) {}
      }
      Product product = Product(
        categoryID: categoryID,
        brandID: brandID,
        productName: productName,
        sku: 'procare',
      );
      DBProvider.createProducts(product);
      emit(AddProductSuccessState());
    }
    return message!;
  }

  Future<String> uploadImage(XFile file, String productId) async {
    String? photoPath;
    String fileName = file.path.split('/').last;
    FormData formData = FormData.fromMap({
      "photoPath": await MultipartFile.fromFile(file.path, filename: fileName),
    });

    emit(UploadPhotoLoadingState());

    DioHelper.postData(
      url: EndPoints.uploadPhoto(productId),
      data: formData,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      //print('value: $value');
      photoPath = value.data['response']['fullPath'];
      // print('photoPath: $photoPath');
      emit(UploadPhotoSuccessState(photoPath: photoPath!));
    });
    return photoPath!;
  }
}
