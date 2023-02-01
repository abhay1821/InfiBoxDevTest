import 'package:hive/hive.dart';
import 'package:infi_devtest/buisness_logic/models/cart_list_model.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';
import 'package:infi_devtest/services/LocalDatabase/localdatabase_service.dart';

class LocalDatabaseServiceImpl extends LocalDatabaseService {
  @override
  List<CartItem> fetchAllCartItems() {
    // final cartBox = await Hive.openBox<CartItem>('cartBox');

    final cartBox = Hive.box<CartItemList>('cartBox');
    // cartBox.clear();
    final data = cartBox.get('cache');
    return data?.items ?? [];

    // print("${cartBox.values.length}----------dakjckj");
    // List<dynamic> ii = cartBox.get('cache') ?? [];
    // print("${ii.length}----------->fdfdfds");
    // return (ii).cast<CartItem>();
  }

  @override
  Future<void> saveCartItems(List<CartItem> cartItem) async {
    final cartBox = Hive.box<CartItemList>('cartBox');
    await cartBox.put('cache', CartItemList(cartItem));
    // cartBox.clear();
  }
}
