part of 'geolocation_bloc.dart';

abstract class GeolocationEvent extends Equatable {
const GeolocationEvent();
@override
List<Object> get props =>[];
}

class LoadGeolocation extends GeolocationEvent{

}

class UpdateGeolocation extends GeolocationEvent{
  final Position position;

  UpdateGeolocation({required position}):position=position;

   @override
List<Object> get props =>[position];
}