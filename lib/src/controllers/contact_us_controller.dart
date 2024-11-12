import 'package:flutter_application_template/src/model/contact_model.dart';
import 'package:flutter_application_template/src/services/contact_us_service.dart';

class ContactUsController {
  final BranchService _branchService = BranchService();

  Future<List<ContactInfo>> getBranchInfo(String languageCode) {
    return _branchService.fetchBranchInfo(languageCode);
  }

  Future<ContactInfo> getComplaintsInfo(String languageCode) {
    return _branchService.fetchComplaintsInfo(languageCode);
  }
}
