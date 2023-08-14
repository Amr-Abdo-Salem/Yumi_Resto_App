import 'package:yumi_resto/models/places_autocomplete_model.dart';

abstract class BasePlacesRepository {
  Future<List<PlaceAutocomplete>?> getAutocomplete(String searchInput);
}
