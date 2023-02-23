import 'index_auth.dart';

class AuthCubit extends Cubit<AuthStates> {
  LoginModel? loginModel;

  AuthCubit() : super(LoginInitialState());
  static AuthCubit get(context) => BlocProvider.of(context);

  void userLogin({
    required String userName,
    required String password,
    required int langId,
  }) {
    emit(LoginLoadingState());

    DioHelper.postData(
      url: EndPoints.LOGIN,
      data: {
        "userName": userName,
        "password": password,
        "langID": langId,
      },
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      CacheHelper.saveData(
          key: 'userEmail', value: loginModel!.response!.user!.userEmail);
      CacheHelper.saveData(
          key: 'userPhone', value: loginModel!.response!.user!.userTelephone);
      CacheHelper.saveData(
          key: 'userName', value: loginModel!.response!.user!.fullName);
      CacheHelper.saveData(
          key: 'userImage', value: loginModel!.response!.user!.userImage);
      emit(LoginSuccessState(loginModel: loginModel!));
    }).catchError((e) {
      emit(LoginErrorState(e.toString()));
    });
  }
}
