part of 'basket_bloc.dart';

abstract class BasketEvent extends Equatable {
  const BasketEvent();
}

class StartBasket extends BasketEvent {
  @override
  List<Object> get props => [];
}

class AddItem extends BasketEvent {
  final MenuItems item;

  const AddItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveItem extends BasketEvent {
  final MenuItems item;

  const RemoveItem(this.item);

  @override
  List<Object> get props => [item];
}

class RemoveAllItem extends BasketEvent {
  final MenuItems item;

  const RemoveAllItem(this.item);

  @override
  List<Object> get props => [item];
}

class ToggleSwitch extends BasketEvent {
  const ToggleSwitch();

  @override
  List<Object?> get props => [];
}

class AddVoucher extends BasketEvent {
  final voucher;
  const AddVoucher(this.voucher);

  @override
  List<Object?> get props => [voucher];
}

class SelectDeliveryTime extends BasketEvent {
  final DeliveryTime deliveryTime;

  const SelectDeliveryTime(this.deliveryTime);

  @override
  List<Object?> get props => [deliveryTime];
}
