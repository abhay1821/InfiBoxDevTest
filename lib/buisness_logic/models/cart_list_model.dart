import 'package:hive/hive.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';

part 'cart_list_model.g.dart';

@HiveType(typeId: 1)
class CartItemList {
  CartItemList(this.items);
  @HiveField(0)
  final List<CartItem> items;
}
