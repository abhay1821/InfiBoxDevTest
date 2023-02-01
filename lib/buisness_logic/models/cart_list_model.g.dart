// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartItemListAdapter extends TypeAdapter<CartItemList> {
  @override
  final int typeId = 1;

  @override
  CartItemList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartItemList(
      (fields[0] as List).cast<CartItem>(),
    );
  }

  @override
  void write(BinaryWriter writer, CartItemList obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.items);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartItemListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
