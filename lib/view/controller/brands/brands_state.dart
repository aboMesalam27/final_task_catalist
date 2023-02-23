import 'index_brands.dart';

abstract class BrandsStates {}

class BrandsInitialState extends BrandsStates {}

class BrandsLoadingState extends BrandsStates {}

class BrandsSuccessState extends BrandsStates {
  List<Brands> brandsList = [];

  BrandsSuccessState({required this.brandsList});
}
