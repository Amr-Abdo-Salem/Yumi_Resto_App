import 'package:http/http.dart' as http;
import 'package:yumi_resto/repositories/places/base_places_repository.dart';
import 'dart:convert' as convert;
import '../../models/place_model.dart';
import '../../models/places_autocomplete_model.dart';

class PlacesRepository extends BasePlacesRepository {
  final String key = 'AIzaSyCaCSJ0BZItSyXqBv8vpD1N4WBffJeKhLQ';
  final String types = 'geocode';
  @override
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var result = json['result'] as Map<String, dynamic>;

    return Place.fromJson(result);
  }
}
