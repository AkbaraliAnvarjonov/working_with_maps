import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:working_with_maps/data/models/lat_long.dart';

class SplashViewModel extends ChangeNotifier {
  late LatLong latLong;

  SplashViewModel() {
    fetchCurrentLocation();
  }
  Location location = Location();

  bool _serviceEnabled = false;
  PermissionStatus _permissionGranted = PermissionStatus.denied;
  fetchCurrentLocation() async {
    //1- qadam location qurilmada enable yoki disable ekanini tekshiradi
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

//2- qadam lakatsiyaga permission oladi

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    // lakatsiyani oladi
    LocationData locationData = await location.getLocation();
    latLong = LatLong(
      lattitude: locationData.latitude!,
      longtitude: locationData.longitude!,
    );
    await Future.delayed(const Duration(seconds: 3));
    notifyListeners();
  }
}
