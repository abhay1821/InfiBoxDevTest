// ignore_for_file: unnecessary_overrides

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:infi_devtest/buisness_logic/models/cart_model.dart';
import 'package:infi_devtest/services/service_locator.dart';

class CartViewModel extends ChangeNotifier {
  late List<CartItem> items = [];

  List<CartItem> get getitems {
    items = localDBService.fetchAllCartItems();
    return items;
  }

  String get totalAmount {
    var total = 0.0;
    for (var element in items) {
      total += element.price * element.quantity;
    }
    return total.toStringAsFixed(2);
  }

  void additem(CartItem cartItem) {
    bool present = false;
    for (var item in items) {
      if (item == cartItem) {
        present = true;
      }
    }

    if (present) {
      final quantity = items.firstWhere((element) => element == cartItem).quantity;
      items.removeWhere((element) => element == cartItem);
      items.add(cartItem.copyWith(quantity: quantity + cartItem.quantity));
    } else {
      items.add(cartItem);
    }
    localDBService.saveCartItems(items).then((value) {
      debugPrint("${localDBService.fetchAllCartItems().length}----------->>");
    });
    notifyListeners();
  }

  void removeitem(String productId) {
    items.removeWhere((element) => element.id.toString() == productId);
    notifyListeners();
  }
}
