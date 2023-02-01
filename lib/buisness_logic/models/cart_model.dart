// ignore_for_file: hash_and_equals

import 'package:hive/hive.dart';
part 'cart_model.g.dart';

@HiveType(typeId: 0)
class CartItem {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final int quantity;
  @HiveField(3)
  final double price;
  @HiveField(4)
  final String imageUrl;

  CartItem({
    required this.id,
    required this.title,
    required this.quantity,
    required this.price,
    required this.imageUrl,
  });

  CartItem copyWith({
    int? id,
    String? title,
    int? quantity,
    double? price,
    String? imageUrl,
  }) {
    return CartItem(
      id: id ?? this.id,
      title: title ?? this.title,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      id: json['id'],
      title: json['title'],
      quantity: json['quantity'],
      price: json['price'],
      imageUrl: json['imageUrl'],
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }

    return other is CartItem && id == other.id;
  }

  @override
  String toString() {
    return "(id: $id, quantity: $quantity)";
  }
}
