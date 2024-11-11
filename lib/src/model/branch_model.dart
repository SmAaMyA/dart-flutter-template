import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchInfo {
  final String name;
  final String address;
  final String phone;
  final String email;
  final String workingHours;
  final LatLng location;

  BranchInfo({
    required this.name,
    required this.address,
    required this.phone,
    required this.email,
    required this.workingHours,
    required this.location,
  });

  factory BranchInfo.fromJson(Map<String, dynamic> json) {
    return BranchInfo(
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      email: json['email'],
      workingHours: json['workingHours'],
      location: LatLng(json['location']['lat'], json['location']['lng']),
    );
  }
}
