import 'package:flutter/cupertino.dart';
import 'package:working_with_maps/data/models/lat_long.dart';
import 'package:working_with_maps/data/repositories/geocoding_repository.dart';

class MapViewModel extends ChangeNotifier {
  MapViewModel({required this.geocodingRepo});

  final GeocodingRepository geocodingRepo;

  String addressText = "";

  fetchAddress({required LatLong latLong, required String kind}) async {
    addressText = await geocodingRepo.getAddress(latLong, kind);
    notifyListeners();
  }
}
