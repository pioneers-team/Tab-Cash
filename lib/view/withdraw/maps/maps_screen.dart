import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:tab_cash/view/withdraw/maps/widgets/distance_and_time.dart';
import 'package:tab_cash/view/withdraw/maps/widgets/place_item.dart';
import 'package:uuid/uuid.dart';
import '../../../config/routes/routes.dart';
import '../../../core/helper/location_helper.dart';
import '../../../core/styles/colors.dart';
import '../../../model/maps/place_details.dart';
import '../../../model/maps/place_directions_model.dart';
import '../../../model/maps/places_suggestion.dart';
import '../../../view_model/maps_cubit/cubit/search_cubit.dart';


class MapsScreen extends StatefulWidget {
  const MapsScreen({Key? key}) : super(key: key);

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  List<PlaceSuggestion> places = [];

  Completer<GoogleMapController> _mapController = Completer();

  FloatingSearchBarController floatingSearchBarController =
  FloatingSearchBarController();
  GlobalKey<FormState> floatingSearchBarKey = GlobalKey<FormState>();
  static Position? position;

  //TODO Variables for getPlacesLocation///
  Set<Marker> markers = {};
  BitmapDescriptor? customIcon;
  getCustomIcon() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, 'assets/icons/search_doctor.png');
  }
  late PlaceSuggestion placeSuggestion;
  late Place selectedPlace;
  late Marker searchedPlaceMarker;
  late Marker currentLocationMarker;
  late CameraPosition goToSearchedForPlacePosition;

  //TODO these variables for getDirections
  PlaceDirections? placeDirections;
  var progressIndicator = false;
  late List<LatLng> polylinePoints;
  var isSearchedPlaceMarkerClicked = false;
  var isTimeAndDistanceVisible = false;
  late String time;
  late String distance;

  @override
  initState() {
    super.initState();
    _getMyCurrentLocation();
    getCustomIcon();
  }


  void buildCameraNewPosition() {
    goToSearchedForPlacePosition = CameraPosition(
      bearing: 0.0,
      tilt: 0.0,
      target: LatLng(
        selectedPlace.result.geometry.location.lat,
        selectedPlace.result.geometry.location.lng,
      ),
      zoom: 10,
    );
  }

  static final CameraPosition _myCurrentLocationCameraPosition = CameraPosition(
      target: LatLng(position!.latitude, position!.longitude),
      bearing: 0.0,
      tilt: 0.0,
      zoom: 10.0
  );

  Future<void> _getMyCurrentLocation() async {
    position = await LocationHelper.getCurrentPosition().whenComplete(() {
      setState(() {});
    });
  }

  Widget buildMap() {
    return GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
            target: LatLng(position!.latitude, position!.longitude),
            bearing: 0.0,
            tilt: 0.0,
            zoom: 10.0
        ),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController controller) {
          setState(() {
            _mapController.complete(controller);
          });
        },
        markers: markers,
        polylines: placeDirections != null
            ? {
          Polyline(
            polylineId: const PolylineId("my_polyline"),
            visible: true,
            points: polylinePoints,
            width: 3,
            color: Colors.red,
          ),
        } : {}

    );
  }

  Future<void> _goToMyCurrentLocation() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(_myCurrentLocationCameraPosition));
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery
            .of(context)
            .orientation == Orientation.portrait;
    return FloatingSearchBar(
        key: floatingSearchBarKey,
        controller: floatingSearchBarController,
        elevation: 6,
        hintStyle: const TextStyle(fontSize: 20, color: Colors.grey),
        queryStyle: const TextStyle(fontSize: 18),
        hint: 'Search ATM ....',
        border: const BorderSide(style: BorderStyle.none),
        margins: const EdgeInsets.fromLTRB(20, 95, 20, 0),
        padding: const EdgeInsets.fromLTRB(2, 0, 30, 0),
        height: 52,
        iconColor: AppColors.primary,
        scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
        transitionDuration: const Duration(milliseconds: 600),
        transitionCurve: Curves.easeInOut,
        physics: const BouncingScrollPhysics(),
        axisAlignment: isPortrait ? 0.0 : -1.0,
        openAxisAlignment: 0.0,
        width: isPortrait ? 600 : 600,
        debounceDelay: const Duration(milliseconds: 500),
        progress: progressIndicator,
        onQueryChanged: (query) {
          getPlacesSuggestions(query);
        },
        onFocusChanged: (_) {
          // hid distance and time:
          setState(() {
            isTimeAndDistanceVisible = false;
          });
        },
        transition: CircularFloatingSearchBarTransition(),
        actions: [
          FloatingSearchBarAction(
            showIfOpened: false,
            child: CircularButton(
              icon: Icon(Icons.place, color: AppColors.primary),
              onPressed: () {},
            ),
          )
        ],
        builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  buildSuggestionBloc(),
                  buildSelectedPlaceLocationBloc(),
                  buildDirectionsBloc(),
                ]),
          );
        });
  }

  Widget buildDirectionsBloc(){
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is PlacesDirectionsLoadedState) {
          placeDirections = (state).placeDirections;
          getPolylinePoints();
          setState(() {});
        }
      },
      child: Container(),
    );
  }

  void getPolylinePoints() {
    polylinePoints = placeDirections!.polylinePoints.map((e) =>
        LatLng(e.latitude, e.longitude)).toList();
  }

  Widget buildSelectedPlaceLocationBloc() {
    return BlocListener<SearchCubit, SearchStates>(
      listener: (context, state) {
        if (state is PlacesDetailsLoadedState) {
          selectedPlace = (state).place;
          goToMySearchedLocation();
          getDirections();
        }
      },
      child: Container(),
    );
  }

  void getDirections(){
    BlocProvider.of<SearchCubit>(context).emitPlacesDirections(
      LatLng(position!.latitude, position!.longitude),
      LatLng(selectedPlace.result.geometry.location.lat,
          selectedPlace.result.geometry.location.lng),
    );
  }

  Future<void> goToMySearchedLocation() async {
    buildCameraNewPosition();
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
        CameraUpdate.newCameraPosition(goToSearchedForPlacePosition));
    buildSearchedPlaceMarker();
  }

  void buildSearchedPlaceMarker(){
    searchedPlaceMarker = Marker(
      position: goToSearchedForPlacePosition.target,
      markerId:  const MarkerId('1'),
      onTap: () {
        buildCurrentLocationMarker();
        // Show Time And Distance :
        setState(() {
          isSearchedPlaceMarkerClicked = true;
          isTimeAndDistanceVisible = true;
        });
      },
      infoWindow: InfoWindow(
        title: "${placeSuggestion.description}",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRose),
    );
    addMarkerToMarkersAndUpdateUi(searchedPlaceMarker);
  }

  void buildCurrentLocationMarker() {
    currentLocationMarker = Marker(
      position: LatLng(position!.latitude, position!.longitude),
      markerId: const MarkerId('2'),
      onTap: () {},
      infoWindow: const InfoWindow(
        title: "Your Current Location",
      ),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    );
    addMarkerToMarkersAndUpdateUi(currentLocationMarker);
  }

  void addMarkerToMarkersAndUpdateUi(Marker marker) {
    setState(() {
      markers.add(marker);
    });
  }

  void getPlacesSuggestions(String query) {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context)
        .emitPlacesSuggestion(query, sessionToken);
  }

  Widget buildSuggestionBloc() {
    return BlocBuilder<SearchCubit, SearchStates>(
        builder: (context, state) {
          if (state is PlacesLoadedState) {
            places = (state).places;
            if (places.length != 0) {
              return buildPlacesList();
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        });
  }

  Widget buildPlacesList() {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        return InkWell(
          onTap: () async {
            placeSuggestion = places[index];
            floatingSearchBarController.close();
            getSelectedPlaceLocation();
            polylinePoints.clear();
            // remove all markers :
          },
          child: PlaceItem(
            suggestion: places[index],
          ),
        );
      },
      itemCount: places.length,
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
    );
  }

  void getSelectedPlaceLocation() async {
    final sessionToken = const Uuid().v4();
    BlocProvider.of<SearchCubit>(context).emitPlacesDetailsLocation(
      placeSuggestion.placeId,
      sessionToken,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.transparent,
        elevation: 0.0,
        title: Text(
          "ATM Tracking",
          style: Theme.of(context).textTheme.displayMedium!.copyWith(
              fontSize: 24.0,
              fontWeight: FontWeight.w400,
              color: AppColors.secondColor),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
                context, Routes.withdrawScreen, (route) => false);
          },
          icon: Icon(
            IconlyLight.arrow_left_2,
          ),
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          position != null
              ? buildMap() : const Center(child: CircularProgressIndicator(),
          ),

          buildFloatingSearchBar(),
          isSearchedPlaceMarkerClicked
              ?
          DistanceAndTime(
            isTimeAndDistanceVisible: isTimeAndDistanceVisible,
            placeDirections: placeDirections,
          )
              : Container(),

        ],),
    );
  }
}
