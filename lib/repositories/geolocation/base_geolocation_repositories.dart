import 'package:geolocator/geolocator.dart';

abstract class BaseGeolocationRepository{

//hashed
Future<Position> getCurrentLocation() async{
return await Geolocator.getCurrentPosition(
    desiredAccuracy: LocationAccuracy.high
    );
 
}

}