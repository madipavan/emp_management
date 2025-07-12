part of 'employee_list_bloc.dart';

class EmployeeListEvent {}

class FetchEmployees extends EmployeeListEvent {}

class AddEmployee extends EmployeeListEvent {
  final EmpModel? emp;
  AddEmployee(this.emp);
}

class SearchEmployees extends EmployeeListEvent {
  final String? filterVal;
  SearchEmployees(this.filterVal);
}
