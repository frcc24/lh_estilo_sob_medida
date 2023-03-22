import 'package:get/get.dart';

import '../modules/create_look/create_look_screen.dart';
import '../modules/explore/explore_screen.dart';
import '../modules/home/home_screen.dart';
import '../modules/login/login_screen.dart';
import '../modules/my_looks/my_looks_screen.dart';
import '../modules/register/register_screen.dart';
import '../modules/welcome_screen/welcome_screen.dart';

List<GetPage> getAppPages() {
  return [
    // Initial pages
    GetPage<void>(
      name: WelcomeScreen.ROUTE,
      page: () => const WelcomeScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: LoginScreen.ROUTE,
      page: () => LoginScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: HomeScreen.ROUTE,
      page: () => HomeScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: ExploreScreen.ROUTE,
      page: () => ExploreScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: CreateLookScreen.ROUTE,
      page: () => CreateLookScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: MyLooksScreen.ROUTE,
      page: () => MyLooksScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
    GetPage<void>(
      name: RegisterScreen.ROUTE,
      page: () => RegisterScreen(),
      //binding: BindingsBuilder(() => Get.lazyPut<SplashScreenController>(() => SplashScreenController())),
    ),
  ];
}
