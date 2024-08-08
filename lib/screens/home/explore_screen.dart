import 'package:doc_finder/widgets/main_search_row.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-33.86, 151.20);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Google Map covering the entire screen
          GoogleMap(
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
          ),
          // Search bar on top of the map
          Positioned(
            top: 35,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 35),
              child: MainSearchRow(searchController: widget._searchController),
            ),
          ),
        ],
      ),
    );
  }
}
