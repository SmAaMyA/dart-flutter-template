// import 'dart:convert';
import 'package:flutter_application_template/src/model/branch_model.dart';
// import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchService {
  Future<List<BranchInfo>> fetchBranchInfo(String languageCode) async {
    // final response = await http
    //     .get(Uri.parse('https://api.example.com/branches?lang=$languageCode'));

    // if (response.statusCode == 200) {
    //   List<dynamic> data = json.decode(response.body);
    //   return data.map((json) => BranchInfo.fromJson(json)).toList();
    // } else {
    //   throw Exception('Failed to load branch info');
    // }
    return fetchMockBranchInfo(languageCode);
  }

  Future<List<BranchInfo>> fetchMockBranchInfo(String languageCode) async {
    switch (languageCode) {
      case 'en':
        return _mockBranchInfoEn();
      case 'zh':
        return _mockBranchInfoZh();
      case 'th':
        return _mockBranchInfoTh();
      default:
        return _mockBranchInfoTh();
    }
  }

  List<BranchInfo> _mockBranchInfoTh() {
    return [
      BranchInfo(
        name: 'สำนักงานใหญ่',
        address:
            '888/1 ถนนคลองลำเจียก แขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230 ประเทศไทย',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.7563, 100.5018),
      ),
      BranchInfo(
        name: 'สาขากาญจนบุรี',
        address:
            '277/106 ถนนแสงชูโต ตำบลบ้านเหนือ อำเภอเมือง จังหวัดกาญจนบุรี 71000 ประเทศไทย',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0228, 99.5328),
      ),
      BranchInfo(
        name: 'สาขาขอนแก่น',
        address:
            '182/104 หมู่ที่ 4 ตำบลในเมือง อำเภอเมืองขอนแก่น จังหวัดขอนแก่น 40000 ประเทศไทย',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4419, 102.8350),
      ),
      BranchInfo(
        name: 'สาขาอุดรธานี',
        address:
            '106/36 ถนนตลาดธนารักษ์ ตำบลหมากแข้ง อำเภอเมือง จังหวัดอุดรธานี 41000 ประเทศไทย',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4138, 102.7876),
      ),
      BranchInfo(
        name: 'สาขาเชียงใหม่-ห้วยแก้ว',
        address:
            '50/4 ถนนห้วยแก้ว ตำบลช้างเผือก อำเภอเมืองเชียงใหม่ จังหวัดเชียงใหม่ 50300 ประเทศไทย',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.7969, 98.9792),
      ),
      BranchInfo(
        name: 'สาขาสิงห์บุรี',
        address:
            '907/35 ถนนขุนสรรค์ ตำบลบางพุทรา อำเภอเมืองสิงห์บุรี จังหวัดสิงห์บุรี 16000 ประเทศไทย',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.8872, 100.4018),
      ),
    ];
  }

  List<BranchInfo> _mockBranchInfoEn() {
    return [
      BranchInfo(
        name: 'Head Office',
        address:
            '888/1 Klong Lamchiak Road, Nuanchan, Bueng Kum, Bangkok 10230, Thailand',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.7563, 100.5018),
      ),
      BranchInfo(
        name: 'Kanchanaburi Branch',
        address:
            '277/106 Saengchuto Road, Ban Nuea, Mueang, Kanchanaburi 71000, Thailand',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0228, 99.5328),
      ),
      BranchInfo(
        name: 'Khon Kaen Branch',
        address:
            '182/104 Moo 4, Nai Mueang, Mueang Khon Kaen, Khon Kaen 40000, Thailand',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4419, 102.8350),
      ),
      BranchInfo(
        name: 'Udon Thani Branch',
        address:
            '106/36 Thanon Talat Thanarak, Mak Khaeng, Mueang, Udon Thani 41000, Thailand',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4138, 102.7876),
      ),
      BranchInfo(
        name: 'Chiang Mai-Huay Kaew Branch',
        address:
            '50/4 Huay Kaew Road, Chang Phueak, Mueang Chiang Mai, Chiang Mai 50300, Thailand',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.7969, 98.9792),
      ),
      BranchInfo(
        name: 'Sing Buri Branch',
        address:
            '907/35 Khun San Road, Bang Phutsa, Mueang, Sing Buri 16000, Thailand',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.8872, 100.4018),
      ),
    ];
  }

  List<BranchInfo> _mockBranchInfoZh() {
    return [
      BranchInfo(
        name: '总部',
        address: '泰国曼谷10230，Bueng Kum，Nuanchan，Klong Lamchiak路888/1号',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.7563, 100.5018),
      ),
      BranchInfo(
        name: '北碧府分行',
        address: '泰国北碧府71000，Mueang，Ban Nuea，Saengchuto路277/106号',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0228, 99.5328),
      ),
      BranchInfo(
        name: '孔敬府分行',
        address: '泰国孔敬府40000，Mueang Khon Kaen，Nai Mueang，Moo 4，182/104号',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4419, 102.8350),
      ),
      BranchInfo(
        name: '乌隆他尼府分行',
        address: '泰国乌隆他尼府41000，Mueang，Mak Khaeng，Thanon Talat Thanarak路106/36号',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4138, 102.7876),
      ),
      BranchInfo(
        name: '清迈-怀凯奥分行',
        address: '泰国清迈府50300，Mueang Chiang Mai，Chang Phueak，Huay Kaew路50/4号',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.7969, 98.9792),
      ),
      BranchInfo(
        name: '信武里府分行',
        address: '泰国信武里府16000，Mueang，Bang Phutsa，Khun San路907/35号',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.8872, 100.4018),
      ),
    ];
  }
}
