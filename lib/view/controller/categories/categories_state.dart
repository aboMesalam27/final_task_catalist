import '../../../data/models/categories_model.dart';


abstract class CategoriesStates {}

class CategoriesInitial extends CategoriesStates {}

class CategoriesLoadingState extends CategoriesStates {}

class CategoriesSuccessState extends CategoriesStates {
  List<Categories> categoriesList = [];

  CategoriesSuccessState({required this.categoriesList});
}


