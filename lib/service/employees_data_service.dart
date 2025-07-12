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
        final data = jsonDecode(response.body);
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

  Future addEmployee(EmpModel emp) async {
    final url = AppUrls.addEmpusrl;
    try {
      await http.post(
        Uri.parse(url),
        body: jsonEncode(emp.toMap()),
        headers: {'Content-Type': 'application/json'},
      );
    } catch (e) {
      debugPrint('Error In AddEmpService:${e.toString()}');
      throw Exception(e.toString());
    }
  }
}
