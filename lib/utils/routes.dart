import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class Routes {
  static const initRoute = '/';
  static const homeScreen = '/homeScreen';
  static const detailScreen = '/detailScreen';

  static List<GetPage> appRoutes = [
    GetPage(
      name: Routes.initRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routes.homeScreen,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.detailScreen,
      page: () => DetailScreen(),
    ),
  ];
}
