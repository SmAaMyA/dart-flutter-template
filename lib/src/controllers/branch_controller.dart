import 'package:flutter_application_template/src/model/branch_model.dart';
import 'package:flutter_application_template/src/services/branch_service.dart';

class BranchController {
  final BranchService _branchService = BranchService();

  Future<List<BranchInfo>> getBranchInfo(String languageCode) {
    return _branchService.fetchBranchInfo(languageCode);
  }
}
