import 'dart:convert';

import 'package:employee_management/presentation/model/emp_model.dart';
import 'package:employee_management/utils/app_urls.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class EmployeesDataService {
  Future<List<EmpModel>?> fetchEmployees() async {
    final url = AppUrls.fetchEmpusrl;
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<EmpModel> emps = [];

        //converting into model
        for (var element in data) {
          emps.add(EmpModel.fromJson(element));
        }
        return emps;
      }
    } catch (e) {
      debugPrint('Error In FetchEmpService:${e.toString()}');
      throw Exception(e.toString());
    }
    return null;
  }
}
