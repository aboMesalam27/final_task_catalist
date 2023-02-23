import 'index_product_details.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsStates> {
  ProductDetailsCubit() : super(ProductDetailsInitialState());
  static ProductDetailsCubit get(context) => BlocProvider.of(context);

  ProductDetailsModel? productDetailsModel;
  void getProductDetails({
    required String userName,
    required String productId,
  }) {
    emit(ProductDetailsLoadingState());
    DioHelper.getData(
      url: EndPoints.getProductDetails(userName, productId),
    ).then((value) {
      productDetailsModel = ProductDetailsModel.fromJson(value.data);
      emit(ProductDetailsSuccessState(productDetailsModel!));
    }).catchError((error) {});
  }
}
