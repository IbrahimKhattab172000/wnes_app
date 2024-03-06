part of '../view.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  late CameraPosition initialCameraPosition;
  late LatLng selectedLocation;
  BitmapDescriptor? markerIcon;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
      target: LatLng(31.056458878848574, 31.366789128616503),
      zoom: 10,
    );
    selectedLocation = initialCameraPosition.target;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppText(
          title: "pick_up_location".tr(),
          color: AppColors.white,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: () {
              print('Selected Location: $selectedLocation');
            },
          ),
        ],
        backgroundColor: AppColors.primary,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        onTap: (LatLng latLng) {
          setState(() {
            selectedLocation = latLng;
          });
        },
        markers: {
          Marker(
            markerId: const MarkerId(
              'selectedLocation',
            ),
            position: selectedLocation,
          ),
        },
      ),
    );
  }
}
