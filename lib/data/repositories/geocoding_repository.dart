

import 'package:working_with_maps/data/api/api_service.dart';
import 'package:working_with_maps/data/models/lat_long.dart';

class GeocodingRepository {
  GeocodingRepository({required this.apiService});

  final ApiService apiService;

  Future<String> getAddress(LatLong latLong, String kind) =>
      apiService.getLocationName(geoCodeText: "${latLong.longtitude},${latLong.lattitude}",kind:kind );
}