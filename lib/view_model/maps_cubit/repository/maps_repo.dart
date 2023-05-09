import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../core/helper/search_helper.dart';
import '../../../model/maps/place_details.dart';
import '../../../model/maps/place_directions_model.dart';
import '../../../model/maps/places_suggestion.dart';


class MapsRepo {
  final SearchHelper searchHelper;
  MapsRepo(this.searchHelper);

  Future<List<PlaceSuggestion>> fetchSuggestions(
      String place, String sessionToken,) async {
     final suggestions =
     await searchHelper.fetchSuggestions(place, sessionToken);
    return suggestions
        .map((suggestion) => PlaceSuggestion.fromJson(suggestion))
        .toList();
  }


  Future<Place> getPlaceLocation(
      String placeId,
      String sessionToken,
      ) async {
    final place =
    await searchHelper.getPlaceLocation(placeId, sessionToken);

    return Place.fromJson(place);
  }


  Future<PlaceDirections> getPlaceDirections(
      LatLng? origin,
      LatLng? destination,
      ) async {
    final directions =
    await searchHelper.getPlaceDirections(origin!, destination!);

    return PlaceDirections.fromJson(directions);
  }
}