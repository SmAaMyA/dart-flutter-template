import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchInfo {
  final String name;
  final String address;
  final String mapUrl;
  final String phone;
  final String? extension;
  final String email;
  final String workingHours;
  final LatLng location;

  BranchInfo({
    required this.name,
    required this.address,
    required this.mapUrl,
    required this.phone,
    this.extension,
    required this.email,
    required this.workingHours,
    required this.location,
  });

  factory BranchInfo.fromJson(Map<String, dynamic> json) {
    return BranchInfo(
      name: json['name'],
      address: json['address'],
      mapUrl: json['mapUrl'],
      phone: json['phone'],
      extension: json['extension'],
      email: json['email'],
      workingHours: json['workingHours'],
      location: LatLng(json['location']['lat'], json['location']['lng']),
    );
  }
}
