import 'package:freezed_annotation/freezed_annotation.dart';

import 'item_model.dart';

part 'cart_item_model.g.dart';

@JsonSerializable()
class CartItemModel {
  String id;
  @JsonKey(name: 'product')
  ItemModel item;
  int quantity;

  CartItemModel({
    required this.id,
    required this.item,
    required this.quantity,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) => _$CartItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemModelToJson(this);


  @override
  String toString() {
    return 'CartItemModel{id: $id, item: $item, quantity: $quantity}';
  }

  double totalPrice() => item.price * quantity;

}
