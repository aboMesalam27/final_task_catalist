import 'package:final_task_catalist/view/screens/add_product_screen.dart';
import 'package:final_task_catalist/view/screens/home_screen.dart';

import '../../shared/index_shared.dart';
import '../../view/screens/index_screens.dart';

class AppRouter {
  static const String login = '/login';
  static const String homeScreen = '/homeScreen';
  static const String addProduct = '/addProduct';

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );
      case homeScreen:
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      case addProduct:
        return MaterialPageRoute(
          builder: (_) => AddProductScreen(),
        );
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppText.noRouteFound),
        ),
        body: const Center(
          child: Text(AppText.noRouteFound),
        ),
      ),
    );
  }
}
