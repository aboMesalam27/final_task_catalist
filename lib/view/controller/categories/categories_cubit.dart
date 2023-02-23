import '../../../data/models/categories_model.dart';
import 'index_categories.dart';

class CategoriesCubit extends Cubit<CategoriesStates> {
  CategoriesCubit() : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);

  List<Categories> categoriesList = [];
  bool withInternet = false;

  void getCategoriesList(context) async {
    emit(CategoriesLoadingState());
    withInternet = await InternetCubit.get(context).checkConnection();
    if (withInternet) {
      DioHelper.getData(
              url: EndPoints.GET_CATEGORIES,
              token: CacheHelper.getData(key: 'token'))
          .then((value) {
        var productsFromApi = value.data['response']['categories'];
        for (var categories in productsFromApi) {
          categoriesList.add(Categories.fromJson(categories));
        }
        emit(CategoriesSuccessState(categoriesList: categoriesList));
      });
    } else {
      categoriesList = [Categories(id: 1200, categoryname: 'procare')];
      emit(CategoriesSuccessState(categoriesList: categoriesList));
    }
  }
}
