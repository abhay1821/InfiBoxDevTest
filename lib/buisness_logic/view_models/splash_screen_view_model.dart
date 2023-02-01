import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/buisness_logic/view_models/base_view_model.dart';
import 'package:infi_devtest/buisness_logic/view_models/database_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';

class SplashScreenViewModel extends BaseModel {
  final LocalDatabase instance = LocalDatabase();

  void init() {
    Future.delayed(
      const Duration(seconds: 1),
      () async {
        await instance.init();
        final userLoggedInBefore = await instance.fetchAuthCred();
        if (userLoggedInBefore) {
          navigationService.removeAllAndPush(
            Routes.homeScreen,
            Routes.splashScreen,
          );
        } else {
          navigationService.removeAllAndPush(
            Routes.authScreen,
            Routes.splashScreen,
          );
        }
      },
    );
  }
}
