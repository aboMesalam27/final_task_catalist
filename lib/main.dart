import 'package:final_task_catalist/shared/index_shared.dart';
import 'package:final_task_catalist/view/controller/internet/index_internet.dart';
import 'package:final_task_catalist/view/screens/index_screens.dart';
import 'index_main.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await DBProvider.initDB();
  await CacheHelper.init();
  runApp(CatalistFinalTask(
    connectivity: Connectivity(),
    appRouter: AppRouter(),
  ));
}

class CatalistFinalTask extends StatefulWidget {
  final Connectivity? connectivity;
  final AppRouter appRouter;
  const CatalistFinalTask(
      {super.key, required this.appRouter, this.connectivity});

  @override
  State<CatalistFinalTask> createState() => _CatalistFinalTaskState();
}

class _CatalistFinalTaskState extends State<CatalistFinalTask> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => InternetCubit()..listenInternet()),
      ],
      child: ScreenUtilInit(
        minTextAdapt: true,
        splitScreenMode: true,
        designSize: const Size(375, 812),
        builder: (c, i) => MaterialApp(
          builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
              child: widget!,
            );
          },
          onGenerateRoute: widget.appRouter.generateRoute,
          title: AppConstants.appName,
          debugShowCheckedModeBanner: false,
          home: isNewUser == false ? const LoginScreen() : HomeScreen(),
        ),
      ),
    );
  }
}
