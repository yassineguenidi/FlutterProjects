import 'package:google_maps_flutter/google_maps_flutter.dart';

class RideDetails {
  // ignore: non_constant_identifier_names
  String pickup_address;
  // ignore: non_constant_identifier_names
  String dropoff_address;
  LatLng pickup;
  LatLng dropoff;
  // ignore: non_constant_identifier_names
  String ride_request_id;
  // ignore: non_constant_identifier_names
  String payment_method;
  // ignore: non_constant_identifier_names
  String rider_name;
  // ignore: non_constant_identifier_names
  String rider_phone;

  RideDetails(
      // ignore: non_constant_identifier_names
      {this.pickup_address,
      // ignore: non_constant_identifier_names
      this.dropoff_address,
      this.pickup,
      this.dropoff,
      // ignore: non_constant_identifier_names
      this.ride_request_id,
      // ignore: non_constant_identifier_names
      this.payment_method,
      // ignore: non_constant_identifier_names
      this.rider_name,
      // ignore: non_constant_identifier_names
      this.rider_phone});
}
