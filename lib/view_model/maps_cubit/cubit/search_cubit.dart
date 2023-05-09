import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:meta/meta.dart';

import '../../../model/maps/place_details.dart';
import '../../../model/maps/place_directions_model.dart';
import '../../../model/maps/places_suggestion.dart';
import '../repository/maps_repo.dart';


part 'search_state.dart';

class SearchCubit extends Cubit<SearchStates> {
  final MapsRepo mapsRepo;
  SearchCubit(this.mapsRepo) : super(SearchInitialState());
 static SearchCubit get(context)=> BlocProvider.of(context);



   void emitPlacesSuggestion(String place,String sessionToken) {
     mapsRepo.fetchSuggestions(place,sessionToken).then((suggestions){
     emit(PlacesLoadedState(suggestions));
   });
  }
  void emitPlacesDetailsLocation(String placeId,String sessionToken) {
    mapsRepo.getPlaceLocation(placeId,sessionToken).then((place){
      emit(PlacesDetailsLoadedState(place));
    });
  }
  void emitPlacesDirections( LatLng? origin, LatLng? destination,) {
    mapsRepo.getPlaceDirections(origin, destination).then((directions){
      emit(PlacesDirectionsLoadedState(directions));
    });
  }
}
