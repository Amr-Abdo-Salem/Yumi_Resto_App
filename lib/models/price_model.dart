import 'package:equatable/equatable.dart';

class Price extends Equatable {
  final int id;
  final String price;

  Price({
    required this.id,
    required this.price,
  });

  @override
  List<Object?> get props => [id, price];

  static List<Price> prices = [
    Price(id: 1, price: 'low'),
    Price(id: 2, price: 'medium'),
    Price(id: 3, price: 'high'),
  ];
}