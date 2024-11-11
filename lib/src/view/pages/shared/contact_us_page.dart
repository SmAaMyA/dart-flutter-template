import 'package:flutter/material.dart';
import 'package:flutter_application_template/src/controllers/branch_controller.dart';
import 'package:flutter_application_template/src/model/branch_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsPage extends StatelessWidget {
  final BranchController _branchController = BranchController();

  ContactUsPage({super.key});

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
              SizedBox(height: 32.0),
              Text(
                AppLocalizations.of(context)!.socialMedia,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        const String url = 'https://line.me/ti/p/~@aslonnet';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw AppLocalizations.of(context)!.failLaunchUrl +
                              ' ' +
                              url;
                        }
                      },
                      child: Tooltip(
                        message: AppLocalizations.of(context)!.lineMenuTooltip,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/logo/line_logo.svg',
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.facebook.com/ASLSecurities';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw AppLocalizations.of(context)!.failLaunchUrl +
                              ' ' +
                              url;
                        }
                      },
                      child: Tooltip(
                        message:
                            AppLocalizations.of(context)!.facebookMenuTooltip,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/logo/facebook_logo.svg',
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.youtube.com/@aslsecuritiesco.ltd.4579';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw AppLocalizations.of(context)!.failLaunchUrl +
                              ' ' +
                              url;
                        }
                      },
                      child: Tooltip(
                        message:
                            AppLocalizations.of(context)!.youtubeMenuTooltip,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/logo/youtube_logo.svg',
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.0),
                    GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.tiktok.com/@aslsecurities';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw AppLocalizations.of(context)!.failLaunchUrl +
                              ' ' +
                              url;
                        }
                      },
                      child: Tooltip(
                        message:
                            AppLocalizations.of(context)!.tiktokMenuTooltip,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SvgPicture.asset(
                            'assets/images/logo/tiktok_logo.svg',
                            fit: BoxFit.cover,
                            width: 48,
                            height: 48,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Text(
                AppLocalizations.of(context)!.branches,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              FutureBuilder<List<BranchInfo>>(
                future: _branchController.getBranchInfo(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      children: snapshot.data!
                          .map((branch) => _buildBranchInfo(
                                context,
                                branch.name,
                                branch.address,
                                branch.phone,
                                branch.email,
                                branch.workingHours,
                                branch.location,
                              ))
                          .toList(),
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return Center(child: CircularProgressIndicator());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildBranchInfo(BuildContext context, String branchName, String address,
    String phone, String email, String workingHours, LatLng location) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        branchName,
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 10.0),
      Row(
        children: [
          Icon(Icons.location_on,
              color: Theme.of(context).colorScheme.inverseSurface),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              address,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        children: [
          Icon(Icons.phone,
              color: Theme.of(context).colorScheme.inverseSurface),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              phone,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        children: [
          Icon(Icons.email,
              color: Theme.of(context).colorScheme.inverseSurface),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              email,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ),
        ],
      ),
      SizedBox(height: 10.0),
      Row(
        children: [
          Icon(Icons.access_time,
              color: Theme.of(context).colorScheme.inverseSurface),
          SizedBox(width: 8.0),
          Expanded(
            child: Text(
              workingHours,
              style: TextStyle(
                  fontSize: 16.0,
                  color: Theme.of(context).colorScheme.inverseSurface),
            ),
          ),
        ],
      ),
      SizedBox(height: 10.0),
      SizedBox(
        height: 200.0,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(
            target: location,
            zoom: 14.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId(branchName),
              position: location,
              infoWindow: InfoWindow(
                title: branchName,
                snippet: address,
              ),
            ),
          },
        ),
      ),
      SizedBox(height: 10.0),
    ],
  );
}
