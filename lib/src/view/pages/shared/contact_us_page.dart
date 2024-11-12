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
    final String languageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.contactUs,
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 4.0,
        centerTitle: true,
        iconTheme:
            IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
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
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/logo/line_logo.svg',
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      tooltip: AppLocalizations.of(context)!.lineMenuTooltip,
                      onPressed: () async {
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
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/logo/facebook_logo.svg',
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      tooltip:
                          AppLocalizations.of(context)!.facebookMenuTooltip,
                      onPressed: () async {
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
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/logo/youtube_logo.svg',
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      tooltip: AppLocalizations.of(context)!.youtubeMenuTooltip,
                      onPressed: () async {
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
                    ),
                    SizedBox(width: 16.0),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/images/logo/tiktok_logo.svg',
                        fit: BoxFit.cover,
                        width: 48,
                        height: 48,
                      ),
                      tooltip:
                          AppLocalizations.of(context)!.facebookMenuTooltip,
                      onPressed: () async {
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
                future: _branchController.getBranchInfo(languageCode),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                        child: Text('No branch information available'));
                  } else {
                    return Column(
                      children: snapshot.data!.map((branch) {
                        return _buildBranchInfo(
                          context,
                          branch.name,
                          branch.address,
                          branch.phone,
                          branch.email,
                          branch.workingHours,
                          branch.location,
                        );
                      }).toList(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBranchInfo(
      BuildContext context,
      String branchName,
      String address,
      String phone,
      String email,
      String workingHours,
      LatLng location) {
    return Stack(
      children: [
        Card(
          color: Theme.of(context).cardColor,
          margin: EdgeInsets.symmetric(vertical: 16.0),
          elevation: 4.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 32.0),
                Row(
                  children: [
                    Icon(Icons.location_on,
                        color: Theme.of(context).colorScheme.inverseSurface),
                    SizedBox(width: 8.0),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          final Uri uri = Uri.parse(
                              'https://www.google.com/maps/search/?api=1&query=${Uri.encodeComponent(address)}');
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw AppLocalizations.of(context)!.failLaunchUrl +
                                ' ' +
                                uri.toString();
                          }
                        },
                        child: Text(
                          address,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
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
                      child: Wrap(
                        children: phone.split(',').expand((phoneNumber) {
                          return [
                            InkWell(
                              onTap: () async {
                                final Uri uri = Uri(
                                    scheme: 'tel', path: phoneNumber.trim());
                                if (await canLaunchUrl(uri)) {
                                  await launchUrl(uri);
                                } else {
                                  throw AppLocalizations.of(context)!
                                          .failLaunchUrl +
                                      ' ' +
                                      uri.toString();
                                }
                              },
                              child: Text(
                                phoneNumber.trim(),
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            Text(
                              ', ',
                              style: TextStyle(fontSize: 16.0),
                            ),
                          ];
                        }).toList()
                          ..removeLast(),
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
                      child: InkWell(
                        onTap: () async {
                          final Uri uri = Uri(scheme: 'mailto', path: email);
                          if (await canLaunchUrl(uri)) {
                            await launchUrl(uri);
                          } else {
                            throw AppLocalizations.of(context)!.failLaunchUrl +
                                ' ' +
                                uri.toString();
                          }
                        },
                        child: Text(
                          email,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
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
                    Text(
                      workingHours,
                      style: TextStyle(fontSize: 16.0),
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
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 16.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Text(
              branchName,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
