part of 'employee_list_bloc.dart';

class EmployeeListEvent {}

class FetchEmployees extends EmployeeListEvent {}

class SearchEmployees extends EmployeeListEvent {
  final String? filterVal;
  SearchEmployees(this.filterVal);
}
