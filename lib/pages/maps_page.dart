import 'package:firebaseappc2/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:logger/logger.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({super.key});

  @override
  State<MapsPage> createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  Logger _logger = Logger();
  Set<Marker> _markers = {};
  @override
  Widget build(BuildContext context) {
    void _onTapAdd(LatLng position) {
      print(_markers.length.toString());
      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId(_markers.length.toString()),
            position: position,
          ),
        );
        print(position);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Maps Page",
          style: titleStyle,
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-6.679630, -78.518984),
          zoom: 18,
        ),
        markers: _markers,
        onTap: _onTapAdd,
      ),
    );
  }
}
