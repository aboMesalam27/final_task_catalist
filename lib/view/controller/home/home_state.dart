import 'package:final_task_catalist/data/models/products_model.dart';

abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class GetProductLoadingState extends HomeStates {}

class GetProductSuccessState extends HomeStates {
  //ProductsModel productsModel;
  List<Product>productsList;
  GetProductSuccessState({required this.productsList});
}
