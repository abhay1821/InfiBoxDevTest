import 'package:flutter/material.dart';
import 'package:infi_devtest/buisness_logic/models/products.dart';
import 'package:infi_devtest/buisness_logic/utils/api_constants.dart';
import 'package:infi_devtest/buisness_logic/utils/enums.dart';
import 'package:infi_devtest/buisness_logic/view_models/base_view_model.dart';
import 'package:infi_devtest/services/service_locator.dart';

class HomeScreenViewModel extends BaseModel {
  List<Products> filterList = [];
  List<Products> productList = [];

  Future<void> init() async {
    setState(ViewState.busy);
    await getAllProducts();
  }

  Future<void> getAllProducts() async {
    final prodList = await apiService.getRequest(ApiConstants.products);
    if (prodList.data != null) {
      productList = (prodList.data! as List).map((e) => Products.fromJson(e)).toList();
      filterList = productList;
      debugPrint(filterList.toString());
      setState(ViewState.idle);
    } else {
      debugPrint(prodList.exception.toString());
    }
  }

  filterprodList(String category, int count) {
    if (count > 1) {
      filterList.addAll(productList.where((element) => element.category == category).toList());
    } else {
      filterList = productList.where((element) => element.category == category).toList();
    }
    // productsList.clear();
    debugPrint(filterList.toString());
    notifyListeners();
  }

  removeProdList(String category, int count) {
    while (filterList.any((element) => element.category == category)) {
      filterList.removeWhere((element) => element.category == category);
    }
    if (count == 0) {
      filterList = productList;
    }
    notifyListeners();
  }

  changeProdList(String value) {
    filterList = productList
        .where(
          (element) =>
              (element.title!.toLowerCase().contains(value) || element.category!.toLowerCase().contains(value)),
        )
        .toList();
    notifyListeners();
  }
}
