import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/cart_list_model.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';
import 'package:infi_devtest/buisness_logic/router.dart' as router;
import 'package:infi_devtest/buisness_logic/utils/routes.dart';
import 'package:infi_devtest/buisness_logic/utils/theme.dart';
import 'package:infi_devtest/buisness_logic/view_models/cart_view_model.dart';
import 'package:infi_devtest/buisness_logic/view_models/database_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(CartItemAdapter());
  Hive.registerAdapter(CartItemListAdapter());
  await Hive.openBox<CartItemList>('cartBox');
  setserviceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartViewModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => LocalDatabase(),
        ),
      ],
      child: MaterialApp(
        title: 'Infinity Box',
        debugShowCheckedModeBanner: false,
        theme: InfiThemes.lightTheme,
        navigatorKey: navigationService.navigatorKey,
        onGenerateRoute: router.onGenerateRoute,
        initialRoute: Routes.splashScreen,
      ),
    );
  }
}
