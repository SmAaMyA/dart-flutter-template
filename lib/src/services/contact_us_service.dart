// import 'dart:convert';
import 'package:flutter_application_template/src/model/contact_model.dart';
// import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchService {
  Future<List<ContactInfo>> fetchBranchInfo(String languageCode) async {
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

  Future<ContactInfo> fetchComplaintsInfo(String languageCode) async {
    // final response = await http
    //     .get(Uri.parse('https://api.example.com/complaints?lang=$languageCode'));

    // if (response.statusCode == 200) {
    //   dynamic data = json.decode(response.body);
    //   return data.map((json) => BranchInfo.fromJson(json));
    // } else {
    //   throw Exception('Failed to load complaints info');
    // }
    return fetchMockComplaintsInfo(languageCode);
  }

  Future<List<ContactInfo>> fetchMockBranchInfo(String languageCode) async {
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

  List<ContactInfo> _mockBranchInfoTh() {
    return [
      ContactInfo(
        name: 'สำนักงานใหญ่',
        address:
            '888/1 ถนนคลองลำเจียก แขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230 ประเทศไทย',
        mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.8206144, 100.6348702),
      ),
      ContactInfo(
        name: 'สาขากาญจนบุรี',
        address:
            '277/106 ถนนแสงชูโต ตำบลบ้านเหนือ อำเภอเมือง จังหวัดกาญจนบุรี 71000 ประเทศไทย',
        mapUrl: 'https://goo.gl/maps/VqSjmBhh4EJrXVfv8',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0273351, 99.5304824),
      ),
      ContactInfo(
        name: 'สาขาขอนแก่น',
        address:
            '182/104 หมู่ที่ 4 ตำบลในเมือง อำเภอเมืองขอนแก่น จังหวัดขอนแก่น 40000 ประเทศไทย',
        mapUrl: 'https://maps.app.goo.gl/7sMHb5y4NpRa6E4PA',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4285248, 102.8504593),
      ),
      ContactInfo(
        name: 'สาขาอุดรธานี',
        address:
            '106/36 ถนนตลาดธนารักษ์ ตำบลหมากแข้ง อำเภอเมือง จังหวัดอุดรธานี 41000 ประเทศไทย',
        mapUrl: 'https://goo.gl/maps/yhKB9BvGrn1v3Lmt8',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4039847, 102.789772),
      ),
      ContactInfo(
        name: 'สาขาเชียงใหม่-ห้วยแก้ว',
        address:
            '50/4 ถนนห้วยแก้ว ตำบลช้างเผือก อำเภอเมืองเชียงใหม่ จังหวัดเชียงใหม่ 50300 ประเทศไทย',
        mapUrl: 'https://goo.gl/maps/AkJb91Qw8q33kYcNA',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.8001637, 98.9702524),
      ),
      ContactInfo(
        name: 'สาขาสิงห์บุรี',
        address:
            '907/35 ถนนขุนสรรค์ ตำบลบางพุทรา อำเภอเมืองสิงห์บุรี จังหวัดสิงห์บุรี 16000 ประเทศไทย',
        mapUrl: 'https://maps.app.goo.gl/qCXpPAGQuBJyE9CY6',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.896215, 100.398268),
      ),
    ];
  }

  List<ContactInfo> _mockBranchInfoEn() {
    return [
      ContactInfo(
        name: 'Head Office',
        address:
            '888/1 Klong Lamchiak Road, Nuanchan, Bueng Kum, Bangkok 10230, Thailand',
        mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.8206144, 100.6348702),
      ),
      ContactInfo(
        name: 'Kanchanaburi Branch',
        address:
            '277/106 Saengchuto Road, Ban Nuea, Mueang, Kanchanaburi 71000, Thailand',
        mapUrl: 'https://goo.gl/maps/VqSjmBhh4EJrXVfv8',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0273351, 99.5304824),
      ),
      ContactInfo(
        name: 'Khon Kaen Branch',
        address:
            '182/104 Moo 4, Nai Mueang, Mueang Khon Kaen, Khon Kaen 40000, Thailand',
        mapUrl: 'https://maps.app.goo.gl/7sMHb5y4NpRa6E4PA',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4285248, 102.8504593),
      ),
      ContactInfo(
        name: 'Udon Thani Branch',
        address:
            '106/36 Thanon Talat Thanarak, Mak Khaeng, Mueang, Udon Thani 41000, Thailand',
        mapUrl: 'https://goo.gl/maps/yhKB9BvGrn1v3Lmt8',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4039847, 102.789772),
      ),
      ContactInfo(
        name: 'Chiang Mai-Huay Kaew Branch',
        address:
            '50/4 Huay Kaew Road, Chang Phueak, Mueang Chiang Mai, Chiang Mai 50300, Thailand',
        mapUrl: 'https://goo.gl/maps/AkJb91Qw8q33kYcNA',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.8001637, 98.9702524),
      ),
      ContactInfo(
        name: 'Sing Buri Branch',
        address:
            '907/35 Khun San Road, Bang Phutsa, Mueang, Sing Buri 16000, Thailand',
        mapUrl: 'https://maps.app.goo.gl/qCXpPAGQuBJyE9CY6',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.896215, 100.398268),
      ),
    ];
  }

  List<ContactInfo> _mockBranchInfoZh() {
    return [
      ContactInfo(
        name: '总部',
        address: '泰国曼谷10230，Bueng Kum，Nuanchan，Klong Lamchiak路888/1号',
        mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
        phone: '(+66) 02-508-1567',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(13.8206144, 100.6348702),
      ),
      ContactInfo(
        name: '北碧府分行',
        address: '泰国北碧府71000，Mueang，Ban Nuea，Saengchuto路277/106号',
        mapUrl: 'https://goo.gl/maps/VqSjmBhh4EJrXVfv8',
        phone: '(+66) 034-918-781, (+66) 034-918-782, (+66) 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0273351, 99.5304824),
      ),
      ContactInfo(
        name: '孔敬府分行',
        address: '泰国孔敬府40000，Mueang Khon Kaen，Nai Mueang，Moo 4，182/104号',
        phone:
            '(+66) 043-053-557, (+66) 043-053-558, (+66) 043-224-103, (+66) 043-224-104',
        mapUrl: 'https://maps.app.goo.gl/7sMHb5y4NpRa6E4PA',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4285248, 102.8504593),
      ),
      ContactInfo(
        name: '乌隆他尼府分行',
        address: '泰国乌隆他尼府41000，Mueang，Mak Khaeng，Thanon Talat Thanarak路106/36号',
        phone:
            '(+66) 042-119-990, (+66) 042-119-991, (+66) 042-119-992, (+66) 042-119-993',
        mapUrl: 'https://goo.gl/maps/yhKB9BvGrn1v3Lmt8',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4039847, 102.789772),
      ),
      ContactInfo(
        name: '清迈-怀凯奥分行',
        address: '泰国清迈府50300，Mueang Chiang Mai，Chang Phueak，Huay Kaew路50/4号',
        mapUrl: 'https://goo.gl/maps/AkJb91Qw8q33kYcNA',
        phone:
            '(+66) 053-217-346, (+66) 053-217-347, (+66) 053-217-348, (+66) 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.8001637, 98.9702524),
      ),
      ContactInfo(
        name: '信武里府分行',
        address: '泰国信武里府16000，Mueang，Bang Phutsa，Khun San路907/35号',
        mapUrl: 'https://maps.app.goo.gl/qCXpPAGQuBJyE9CY6',
        phone: '(+66) 036-691-161, (+66) 036-691-162, (+66) 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.896215, 100.398268),
      ),
    ];
  }

  Future<ContactInfo> fetchMockComplaintsInfo(String languageCode) async {
    switch (languageCode) {
      case 'en':
        return _mockComplaintsInfoEn();
      case 'zh':
        return _mockComplaintsInfoZh();
      case 'th':
        return _mockComplaintsInfoTh();
      default:
        return _mockComplaintsInfoTh();
    }
  }

  Future<ContactInfo> _mockComplaintsInfoTh() async {
    return ContactInfo(
      name: 'สำนักงานใหญ่',
      description:
          'กรณีท่านมีข้อร้องเรียน คำแนะนำ หรือข้อเสนอแนะเกี่ยวกับการปฏิบัติงานใด ๆ ของพนักงาน บริษัทหลักทรัพย์ เอเอสแอล จำกัด สามารถติดต่อมายังฝ่ายกำกับและตรวจสอบ',
      address:
          '888/1 ถนนคลองลำเจียก แขวงนวลจันทร์ เขตบึงกุ่ม กรุงเทพมหานคร 10230 ประเทศไทย',
      mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
      phone: '(+66) 02-508-1567',
      extension: '3300, 3301, 3302',
      email: 'callcenter@aslsecurities.com',
      workingHours: '08:30 - 17:00',
      location: LatLng(13.8206144, 100.6348702),
    );
  }

  Future<ContactInfo> _mockComplaintsInfoEn() async {
    return ContactInfo(
      name: 'Head Office',
      description:
          'If you have any complaints, suggestions, or feedback on the conduct of any of the employees of ASL Securities Co., Ltd., please contact the Supervision and Inspection Department',
      address:
          '888/1 Klong Lamchiak Road, Nuanchan, Bueng Kum, Bangkok 10230, Thailand',
      mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
      phone: '(+66) 02-508-1567',
      extension: '3300, 3301, 3302',
      email: 'callcenter@aslsecurities.com',
      workingHours: '08:30 - 17:00',
      location: LatLng(13.8206144, 100.6348702),
    );
  }

  Future<ContactInfo> _mockComplaintsInfoZh() async {
    return ContactInfo(
      name: '总部',
      description: '如果您对ASL证券有限公司的任何员工的行为有任何投诉、建议或反馈，请联系监督和检查部门',
      address: '泰国曼谷10230，Bueng Kum，Nuanchan，Klong Lamchiak路888/1号',
      mapUrl: 'https://goo.gl/maps/pg9qVSVHC5R84ErH8',
      phone: '(+66) 02-508-1567',
      extension: '3300, 3301, 3302',
      email: 'callcenter@aslsecurities.com',
      workingHours: '08:30 - 17:00',
      location: LatLng(13.8206144, 100.6348702),
    );
  }
}
