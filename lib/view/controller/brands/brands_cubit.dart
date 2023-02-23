import 'index_brands.dart';

class BrandsCubit extends Cubit<BrandsStates> {
  BrandsCubit() : super(BrandsInitialState());
  static BrandsCubit get(context) => BlocProvider.of(context);
  List<Brands> brandsList = [];
  bool withInternet = false;
  Future<List<Brands>> getBrandsList(context) async {
    emit(BrandsLoadingState());
    withInternet = await InternetCubit.get(context).checkConnection();
    if (withInternet) {
      DioHelper.getData(
              url: EndPoints.GET_BRANDS,
              token: CacheHelper.getData(key: 'token'))
          .then((value) {
        var productsFromApi = value.data['response']['brands'];
        for (var brands in productsFromApi) {
          brandsList.add(Brands.fromJson(brands));
        }

        emit(BrandsSuccessState(brandsList: brandsList));
      });
    } else {
      brandsList = [Brands(id: 1085, brandName: 'Procare')];
      emit(BrandsSuccessState(brandsList: brandsList));
    }
    return brandsList;
  }
}
