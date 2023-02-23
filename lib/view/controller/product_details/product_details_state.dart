import 'index_product_details.dart';

abstract class ProductDetailsStates {}

class ProductDetailsInitialState extends ProductDetailsStates {}

class ProductDetailsLoadingState extends ProductDetailsStates {}

class ProductDetailsSuccessState extends ProductDetailsStates {
  ProductDetailsModel productDetailsModel;

  ProductDetailsSuccessState(this.productDetailsModel);
}
