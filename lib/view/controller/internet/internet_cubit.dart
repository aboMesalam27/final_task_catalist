import 'index_internet.dart';

class InternetCubit extends Cubit<InternetStates> {
  StreamSubscription? streamSubscription;
  InternetCubit() : super(InternetInit());
  static InternetCubit get(context) => BlocProvider.of(context);
  bool isConnected = false;
  void connected() {
    isConnected = true;
    emit(InternetConnected(isConnected: true));
  }

  void notConnected() {
    isConnected = false;
    emit(InternetDisconnected());
  }

  void listenInternet() {
    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {

        connected();
      } else {
        notConnected();
      }
    });
  }

  Future<bool> checkConnection() {
    return Connectivity().checkConnectivity().then((value) {
      if (value == ConnectivityResult.wifi ||
          value == ConnectivityResult.mobile) {
        return true;
      } else {
        return false;
      }
    });
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }
}
