import 'package:get_it/get_it.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/buisness_logic/view_models/home_screen_view_model.dart';
import 'package:infi_devtest/buisness_logic/view_models/splash_screen_view_model.dart';
import 'package:infi_devtest/services/Api/api_service_implementation.dart';
import 'package:infi_devtest/services/LocalDatabase/localdatabase_service_impl.dart';
import 'package:infi_devtest/services/Navigation/navigation_service_imple.dart';
import 'SizeConfig/size_config_imple.dart';

GetIt serviceLocator = GetIt.instance;
final navigationService = serviceLocator<NavigationServiceImpl>();
final sizeConfig = serviceLocator<SizeConfigImpl>();
final apiService = serviceLocator<ApiServiceImpl>();
final localDBService = serviceLocator<LocalDatabaseServiceImpl>();

void setserviceLocator() {
  serviceLocator.registerSingleton(SizeConfigImpl());
  serviceLocator.registerSingleton(NavigationServiceImpl());
  serviceLocator.registerSingleton(ApiServiceImpl());
  serviceLocator.registerSingleton(LocalDatabaseServiceImpl());

  serviceLocator.registerFactory(() => HomeScreenViewModel());
  serviceLocator.registerFactory(() => SplashScreenViewModel());
  serviceLocator.registerFactory(() => CartViewModel());
}
