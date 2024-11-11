import 'dart:convert';

import 'package:flutter_application_template/src/model/branch_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class BranchService {
  Future<List<BranchInfo>> fetchBranchInfo() async {
    final response =
        await http.get(Uri.parse('https://api.example.com/branches'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((json) => BranchInfo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load branch info');
    }
  }

  Future<List<BranchInfo>> fetchMockBranchInfo() async {
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
        phone: '034-918-781, 034-918-782, 034-910-100',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.0228, 99.5328),
      ),
      BranchInfo(
        name: 'สาขาขอนแก่น',
        address:
            '182/104 หมู่ที่ 4 ตำบลในเมือง อำเภอเมืองขอนแก่น จังหวัดขอนแก่น 40000 ประเทศไทย',
        phone: '043-053-557, 043-053-558, 043-224-103, 043-224-104',
        email: 'aslkhonkaen@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(16.4419, 102.8350),
      ),
      BranchInfo(
        name: 'สาขาอุดรธานี',
        address:
            '106/36 ถนนตลาดธนารักษ์ ตำบลหมากแข้ง อำเภอเมือง จังหวัดอุดรธานี 41000 ประเทศไทย',
        phone: '042-119-990, 042-119-991, 042-119-992, 042-119-993',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(17.4138, 102.7876),
      ),
      BranchInfo(
        name: 'สาขาเชียงใหม่-ห้วยแก้ว',
        address:
            '50/4 ถนนห้วยแก้ว ตำบลช้างเผือก อำเภอเมืองเชียงใหม่ จังหวัดเชียงใหม่ 50300 ประเทศไทย',
        phone: '053-217-346, 053-217-347, 053-217-348, 053-217-349',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(18.7969, 98.9792),
      ),
      BranchInfo(
        name: 'สาขาสิงห์บุรี',
        address:
            '907/35 ถนนขุนสรรค์ ตำบลบางพุทรา อำเภอเมืองสิงห์บุรี จังหวัดสิงห์บุรี 16000 ประเทศไทย',
        phone: '036-691-161, 036-691-162, 036-691-163',
        email: 'callcenter@aslsecurities.com',
        workingHours: '08:30 - 17:00',
        location: LatLng(14.8872, 100.4018),
      ),
    ];
  }
}
