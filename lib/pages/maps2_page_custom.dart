import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map2Page extends StatefulWidget {
  @override
  State<Map2Page> createState() => _Map2PageState();
}

class _Map2PageState extends State<Map2Page> {
  Set<Marker> _markers = {};
  CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();
  addMarkers() async {
    Set<Marker> auxMarkers = Set();
    LatLng pos1 = LatLng(-6.679056391069261, -78.51938559298708);
    LatLng pos2 = LatLng(-6.6801527243696315, -78.51902903066602);
    LatLng pos3 = LatLng(-6.679768442873898, -78.51985974500974);
    BitmapDescriptor designBit1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(18, 18)), "assets/icons/orange_ios.png");
    BitmapDescriptor designBit2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(18, 18)), "assets/icons/blue_ios.png");
    BitmapDescriptor designBit3 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(18, 18)), "assets/icons/green_ios.png");
    auxMarkers.add(
      Marker(
        markerId: MarkerId("1"),
        position: pos1,
        icon: designBit1,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              width: 200,
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    softWrap: true,
                    "Esta es la DIRECCIÓN",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Este es el punto de partido, traer agua",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            pos1,
          );
        },
      ),
    );
    auxMarkers.add(
      Marker(
        markerId: MarkerId("2"),
        position: pos2,
        icon: designBit2,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              width: 200,
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    softWrap: true,
                    "Esta es la DIRECCIÓN 2",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Este es el punto de encuentro, traer agua",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            pos2,
          );
        },
      ),
    );
    auxMarkers.add(
      Marker(
        markerId: MarkerId("3"),
        position: pos3,
        icon: designBit3,
        onTap: () {
          _customInfoWindowController.addInfoWindow!(
            Container(
              width: 200,
              height: 300,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(
                  color: Colors.white,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Text(
                    softWrap: true,
                    "Esta es la DIRECCIÓN 3",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  Text(
                    "Este es el punto de partido, traer agua",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
            pos3,
          );
        },
      ),
    );
    setState(() {
      _markers = auxMarkers;
    });
  }

  @override
  void initState() {
    addMarkers();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maps with custom marker"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onTap: (LatLng lng) {
              _customInfoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              _customInfoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(-6.679630, -78.518984),
              zoom: 17,
            ),
            markers: _markers,
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            width: 400,
            height: 200,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
