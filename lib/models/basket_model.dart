import 'package:equatable/equatable.dart';
import 'models.dart';

class Basket extends Equatable {
  final List<MenuItems> items;
  final bool cutlery;
  final Voucher? voucher;
  final DeliveryTime? deliveryTime;

  Basket({
    this.items = const <MenuItems>[],
    this.cutlery = false,
    this.voucher,
    this.deliveryTime,
  });

  Basket copyWith({
    List<MenuItems>? items,
    bool? cutlery,
    Voucher? voucher,
    DeliveryTime? deliveryTime,
    //required DeliveryTime deliveryTime,
  }) {
    return Basket(
      items: items ?? this.items,
      cutlery: cutlery ?? this.cutlery,
      voucher: voucher ?? this.voucher,
      deliveryTime: deliveryTime ?? this.deliveryTime,
    );
  }

  @override
  List<Object?> get props => [
        items,
        cutlery,
        voucher,
        deliveryTime,
      ];

  Map itemQuantity(itmes) {
    var quantity = Map();

    items.forEach((item) {
      if (!quantity.containsKey(item)) {
        quantity[item] = 1;
      } else {
        quantity[item] += 1;
      }
    });
    return quantity;
  }

  double get subtotal =>
      items.fold(0, (total, current) => total + current.price);

  double total(subtotal) {
    return (voucher == null) ? subtotal + 3 : subtotal + 3 - voucher!.value;
  }

  String get subtotalString => subtotal.toStringAsFixed(2);

  String get totalString => total(subtotal).toStringAsFixed(2);
}
