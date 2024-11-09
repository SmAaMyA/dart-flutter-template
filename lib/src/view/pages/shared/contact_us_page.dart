import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.contactUs),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.contactUsDescription,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                AppLocalizations.of(context)!.phone,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '(+66) 02-508-1567',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
              SizedBox(height: 16.0),
              Text(
                AppLocalizations.of(context)!.email,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                'callcenter@aslsecurities.com',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
              SizedBox(height: 16.0),
              Text(
                'LINE:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '@aslonnet',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
              SizedBox(height: 16.0),
              Text(
                AppLocalizations.of(context)!.workingHours,
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 8.0),
              Text(
                '08:30 - 17:00 (GMT+7)',
                style: TextStyle(fontSize: 16.0, color: Colors.blue),
              ),
              SizedBox(height: 16.0),
              SizedBox(
                height: 300.0,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: LatLng(
                        13.7563, 100.5018), // Coordinates for Bangkok, Thailand
                    zoom: 14.0,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId('aslsecurities'),
                      position: LatLng(13.7563, 100.5018),
                      infoWindow: InfoWindow(
                        title: 'ASL Securities',
                        snippet: 'Bangkok, Thailand',
                      ),
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
