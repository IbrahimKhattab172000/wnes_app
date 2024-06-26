import 'package:custom_map_markers/custom_map_markers.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wnes_app/app/widgets/app_marker.dart';
import 'package:wnes_app/business_logic/helpers/utils.dart';
import 'package:wnes_app/business_logic/utils/location_service.dart';
import 'package:wnes_app/data/models/place.dart';

class IncubatorsView extends StatefulWidget {
  const IncubatorsView({super.key});

  @override
  State<IncubatorsView> createState() => _IncubatorsViewState();
}

class _IncubatorsViewState extends State<IncubatorsView> {
  late CameraPosition initialCameraPosition;
  GoogleMapController? googleMapController;
  late LocationService locationService;
  bool isFirstCall = true;
  Set<Marker> markers = {};
  Set<Polyline> ployLines = {};
  Set<Polygon> polyGons = {};
  Set<Circle> circles = {};
  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.056955301332312, 31.380596286778353),
      zoom: 15,
    );
    locationService = LocationService();

    initMarkers();

    super.initState();
  }

  @override
  void dispose() {
    googleMapController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGoogleMapMarkerBuilder(
        customMarkers: places
            .map(
              (place) => MarkerData(
                marker: Marker(
                  markerId: MarkerId(place.id.toString()),
                  position: place.latLng,
                  infoWindow: InfoWindow(
                    title: place.name,
                    snippet: "Fixed Label",
                  ),
                ),
                child: AppMapMarker(
                  image: "marker",
                  title: place.name,
                ),
              ),
            )
            .toList(),
        builder: (_, markers) => GoogleMap(
          markers: markers ?? {},
          initialCameraPosition: initialCameraPosition,
          myLocationButtonEnabled: false,
        ),
      ),
    );
  }

  initMarkers() async {
    var customMarkerIcon = BitmapDescriptor.fromBytes(
      await locationService.getImageFromRawData(
          image: Utils.getAssetPNGPath("marker"), width: 200),
    );
    var myMarkers = places
        .map(
          (placeModel) => Marker(
            icon: customMarkerIcon,
            infoWindow: InfoWindow(
              title: placeModel.name,
              snippet: "Fixed Label",
            ),
            markerId: MarkerId(
              placeModel.id.toString(),
            ),
            position: placeModel.latLng,
          ),
        )
        .toSet();
    markers.addAll(myMarkers);
    setState(() {});
  }
}
