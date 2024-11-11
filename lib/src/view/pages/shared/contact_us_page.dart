import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/line_logo.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        const String url = 'https://line.me/ti/p/~@aslonnet';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        '@aslonnet',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/facebook_logo.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.facebook.com/ASLSecurities';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'https://www.facebook.com/ASLSecurities',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/youtube_logo.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.youtube.com/@aslsecuritiesco.ltd.4579';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'https://www.youtube.com/@aslsecuritiesco.ltd.4579',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/logo/tiktok_logo.svg',
                    width: 24.0,
                    height: 24.0,
                  ),
                  SizedBox(width: 8.0),
                  Expanded(
                    child: GestureDetector(
                      onTap: () async {
                        const String url =
                            'https://www.tiktok.com/@aslsecurities';
                        final Uri uri = Uri.parse(url);
                        if (await canLaunchUrl(uri)) {
                          await launchUrl(uri);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                      child: Text(
                        'https://www.tiktok.com/@aslsecurities',
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Theme.of(context).colorScheme.inverseSurface,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Divider(),
              SizedBox(height: 16.0),
              Text(
                AppLocalizations.of(context)!.branches,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              _buildBranchInfo(
                context,
                'สำนักงานใหญ่',
                '888/1 ถนนคลองลำเจียก แขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230 ประเทศไทย',
                '(+66) 02-508-1567',
                'callcenter@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(13.7563, 100.5018),
              ),
              Divider(),
              _buildBranchInfo(
                context,
                'สาขากาญจนบุรี',
                '277/106 ถนนแสงชูโต ตำบลบ้านเหนือ อำเภอเมือง จังหวัดกาญจนบุรี 71000 ประเทศไทย',
                '034-918-781, 034-918-782, 034-910-100',
                'callcenter@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(14.0228, 99.5328),
              ),
              Divider(),
              _buildBranchInfo(
                context,
                'สาขาขอนแก่น',
                '182/104 หมู่ที่ 4 ตำบลในเมือง อำเภอเมืองขอนแก่น จังหวัดขอนแก่น 40000 ประเทศไทย',
                '043-053-557, 043-053-558, 043-224-103, 043-224-104',
                'aslkhonkaen@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(16.4419, 102.8350),
              ),
              Divider(),
              _buildBranchInfo(
                context,
                'สาขาอุดรธานี',
                '106/36 ถนนตลาดธนารักษ์ ตำบลหมากแข้ง อำเภอเมือง จังหวัดอุดรธานี 41000 ประเทศไทย',
                '042-119-990, 042-119-991, 042-119-992, 042-119-993',
                'callcenter@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(17.4138, 102.7876),
              ),
              Divider(),
              _buildBranchInfo(
                context,
                'สาขาเชียงใหม่-ห้วยแก้ว',
                '50/4 ถนนห้วยแก้ว ตำบลช้างเผือก อำเภอเมืองเชียงใหม่ จังหวัดเชียงใหม่ 50300 ประเทศไทย',
                '053-217-346, 053-217-347, 053-217-348, 053-217-349',
                'callcenter@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(18.7969, 98.9792),
              ),
              Divider(),
              _buildBranchInfo(
                context,
                'สาขาสิงห์บุรี',
                '907/35 ถนนขุนสรรค์ ตำบลบางพุทรา อำเภอเมืองสิงห์บุรี จังหวัดสิงห์บุรี 16000 ประเทศไทย',
                '036-691-161, 036-691-162, 036-691-163',
                'callcenter@aslsecurities.com',
                '08:30 - 17:00',
                LatLng(14.8872, 100.4018),
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
}
