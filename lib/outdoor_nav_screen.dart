import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:latlong2/latlong.dart';

class OutdoorNavScreen extends StatefulWidget {
  const OutdoorNavScreen({super.key});

  @override
  State<OutdoorNavScreen> createState() => _OutdoorNavScreenState();
}

class _OutdoorNavScreenState extends State<OutdoorNavScreen> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();
  final MapController _mapController = MapController();

  LatLng? currentLocation;
  LatLng? destination;
  List<LatLng> polylinePoints = [];
  String? selectedBuildingName;

  final Map<String, LatLng> buildings = {
    "Admin Block": const LatLng(17.410740648218695, 78.39863285866547),
    "IT Block": const LatLng(17.412033945341914, 78.39867321580483),
    "Hostel": const LatLng(17.41349483090846, 78.3990890294549),
    "Memorial": const LatLng(17.411261688822382, 78.39902803327318),
    "Innovation": const LatLng(17.411316508136395, 78.39861675592658),
    "BasketBall": const LatLng(17.411662042797523, 78.39886587893146),
    "ETM Block": const LatLng(17.411639867886866, 78.39858581075322),
    "EEE Block": const LatLng(17.412183201305798, 78.39824028256741),
    "CSE Block": const LatLng(17.41250487632522, 78.39847855192507),
    "Open Auditorium": const LatLng(17.412085453151512, 78.39947823464937),
    "Silver Jubilee": const LatLng(17.412922965437158, 78.39895074056327),
    "Canteen": const LatLng(17.41247345884353, 78.39949575938438),
    "Parking": const LatLng(17.41277925362815, 78.40009875115481),
    "ECE Block": const LatLng(17.413013531080182, 78.39878119240495),
    "Xerox Shop": const LatLng(17.41230125521796, 78.39832431403553),
    "Juice Centre": const LatLng(17.41235221610836, 78.39823206455551),
    "Chat Shop": const LatLng(17.41230125521796, 78.39832431403553),
    "ATM": const LatLng(17.412460917574716, 78.39847736865877),
  };

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      return;
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLocation = LatLng(position.latitude, position.longitude);
    });
  }

  Future<void> fetchRoute(LatLng start, LatLng end) async {
    const apiKey = "cd855e8128064502bb52cb52f27e621a";
    final url =
        'https://api.geoapify.com/v1/routing?waypoints=${start.latitude},${start.longitude}|${end.latitude},${end.longitude}&mode=walk&apiKey=$apiKey';

    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List coords = data['features'][0]['geometry']['coordinates'][0];

      setState(() {
        polylinePoints = coords.map<LatLng>((c) => LatLng(c[1], c[0])).toList();
      });

      debugPrint("✅ Polyline loaded: ${polylinePoints.length} points");
    } else {
      debugPrint('❌ Route fetch failed: ${response.statusCode}');
    }
  }

  void _searchBuilding() async {
    String query = _searchController.text.trim();
    if (buildings.containsKey(query)) {
      LatLng dest = buildings[query]!;

      if (currentLocation != null) {
        setState(() {
          destination = dest;
          selectedBuildingName = query;
          polylinePoints.clear();
        });

        await fetchRoute(currentLocation!, dest);

        _mapController.move(
          LatLng(dest.latitude + 0.0003, dest.longitude),
          18.0,
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Building '$query' not found")));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentLocation == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    List<Marker> markers = [
      Marker(
        point: currentLocation!,
        width: 50,
        height: 50,
        child: const Icon(Icons.my_location, color: Colors.blue, size: 30),
      ),
    ];

    if (destination != null) {
      markers.add(
        Marker(
          point: destination!,
          width: 100,
          height: 80,
          child: Column(
            children: [
              if (selectedBuildingName != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    selectedBuildingName!,
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              const Icon(Icons.location_on, color: Colors.red, size: 30),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Outdoor Navigation")),
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: currentLocation!,
              initialZoom: 17,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              ),
              MarkerLayer(markers: markers),
              if (polylinePoints.isNotEmpty)
                PolylineLayer(
                  polylines: [
                    Polyline(
                      points: polylinePoints,
                      color: Colors.green,
                      strokeWidth: 4,
                    ),
                  ],
                ),
            ],
          ),
          Positioned(
            top: 15,
            left: 10,
            right: 70,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: RawAutocomplete<String>(
                textEditingController: _searchController,
                focusNode: _searchFocusNode,
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text.isEmpty) {
                    return const Iterable<String>.empty();
                  }
                  return buildings.keys.where((String option) {
                    return option.toLowerCase().contains(
                      textEditingValue.text.toLowerCase(),
                    );
                  });
                },
                onSelected: (String selection) {
                  _searchController.text = selection;
                  _searchBuilding(); // ✅ Calls path update
                },
                fieldViewBuilder: (
                  context,
                  controller,
                  focusNode,
                  onFieldSubmitted,
                ) {
                  return TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      hintText: "Search building...",
                      border: InputBorder.none,
                    ),
                    onSubmitted: (val) => _searchBuilding(),
                  );
                },
                optionsViewBuilder: (context, onSelected, options) {
                  return Align(
                    alignment: Alignment.topLeft,
                    child: Material(
                      elevation: 4.0,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: options.length,
                        itemBuilder: (BuildContext context, int index) {
                          final String option = options.elementAt(index);
                          return ListTile(
                            title: Text(option),
                            onTap: () {
                              onSelected(option);
                            },
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: 15,
            right: 10,
            child: ElevatedButton(
              onPressed: _searchBuilding,
              child: const Icon(Icons.search),
            ),
          ),
        ],
      ),
    );
  }
}
