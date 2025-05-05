import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class rider_profile extends StatefulWidget {
  @override
  _rider_profileState createState() => _rider_profileState();
}

class _rider_profileState extends State<rider_profile> {
  late GoogleMapController _mapController;
  Set<Marker> _markers = {};
LatLng? _currentPosition;
  bool _isLoading = false;

  // Function to get the current location

  Future<void> _getCurrentLocation() async {
    LocationPermission permission;

    // Check if permission is granted
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Show a message or fallback UI
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Location permission denied')),
          );
        }
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, show dialog or settings prompt
      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Permission Permanently Denied'),
            content: Text('Location permissions are permanently denied. Please enable them from settings.'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          ),
        );
      }
      return;
    }

    // If permission is granted, get the current location
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      if (mounted) {
        setState(() {
          _currentPosition = LatLng(position.latitude, position.longitude);
        });
        _getNearbyPetCareShops(_currentPosition!);
      }
    } catch (e) {
      print('Failed to get location: $e');
    }
  }

  // Function to get nearby pet care shops using Google Places API
  Future<void> _getNearbyPetCareShops(LatLng currentPosition) async {
    if (!mounted) return;

    setState(() {
      _isLoading = true;
    });

    // Replace with your own Google Places API Key
    String apiKey = 'AIzaSyCVRj27DSJKoWjBtnvHKUZptljkGvqHZkQ';
    String url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=${currentPosition.latitude},${currentPosition.longitude}&radius=30000&type=pet_store&key=$apiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      List results = data['results'] as List;

      if (mounted) {
        setState(() {
          _markers.clear();
          for (var result in results) {
            var lat = result['geometry']['location']['lat'];
            var lng = result['geometry']['location']['lng'];
            _markers.add(Marker(
              markerId: MarkerId(result['place_id'].toString()),
              position: LatLng(double.parse(lat.toString()), double.parse(lng.toString())),
              infoWindow: InfoWindow(
                title: result['name'].toString(),
                snippet: result['vicinity'].toString(),
              ),
            ));
          }
          _isLoading = false;
        });
      }
    } else {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      print('Failed to load pet care shops');
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  void dispose() {
    // Clean up resources
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pet Care Shops Nearby"),
      ),
      body:(_isLoading || _currentPosition == null)
        ? Center(child: CircularProgressIndicator())
        : GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            initialCameraPosition: CameraPosition(
              target: _currentPosition!,
              zoom: 14.0,
            ),
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
          ),
          
          
        
        
        
        
        
        
        
        
        
        
        
    );
  }
}