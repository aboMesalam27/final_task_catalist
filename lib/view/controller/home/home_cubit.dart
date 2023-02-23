
import 'index_home.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());
  static HomeCubit get(context) => BlocProvider.of(context);
  bool withInternet = false;
  Future<List<Product>> getAllProducts(
      String username, String langId, context) async {
    List<Product> productsList = [];
    emit(GetProductLoadingState());
    withInternet = await InternetCubit.get(context).checkConnection();
    if (withInternet) {
      DioHelper.getData(
              url: EndPoints.getAllProducts(username, langId),
              token: CacheHelper.getData(key: 'token'))
          .then((value) async {
        if (kDebugMode) {
          print('data from api ');
        }
        var productsFromApi = value.data['response']['products'];
        for (var products in productsFromApi) {
          productsList.add(Product.fromJson(products));
        }
        await DBProvider.deleteAllProducts();
        (productsFromApi).map((products) {
          DBProvider.createProducts(Product.fromJson(products));
        }).toList();
        emit(GetProductSuccessState(productsList: productsList));
      });
    } else {
      if (kDebugMode) {
        print('data from database ');
      }
      DBProvider.getAllProducts().then((dataList) {
        productsList = dataList;
        emit(GetProductSuccessState(productsList: productsList));
      });
    }
    return productsList;
  }
}
