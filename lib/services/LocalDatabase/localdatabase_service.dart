import 'package:infi_devtest/buisness_logic/models/cart_model.dart';

abstract class LocalDatabaseService {
  List<CartItem> fetchAllCartItems();
  void saveCartItems(List<CartItem> cartItem);
}
