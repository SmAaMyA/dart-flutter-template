import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactInfo {
  final String? name;
  final String? description;
  final String? address;
  final String? mapUrl;
  final String? phone;
  final String? extension;
  final String? email;
  final String? workingHours;
  final LatLng? location;

  ContactInfo({
    this.name,
    this.description,
    this.address,
    this.mapUrl,
    this.phone,
    this.extension,
    this.email,
    this.workingHours,
    this.location,
  });

  factory ContactInfo.fromJson(Map<String, dynamic> json) {
    return ContactInfo(
      name: json['name'],
      description: json['description'],
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
