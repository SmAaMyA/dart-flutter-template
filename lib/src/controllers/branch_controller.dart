import 'package:flutter_application_template/src/model/branch_model.dart';
import 'package:flutter_application_template/src/services/branch_service.dart';

class BranchController {
  final BranchService _branchService = BranchService();

  Future<List<BranchInfo>> getBranchInfo() {
    // return _branchService.fetchBranchInfo();

    // Use the mock data method for testing
    return _branchService.fetchMockBranchInfo();
  }
}
