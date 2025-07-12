part of 'employee_list_bloc.dart';

abstract class EmployeeListState extends Equatable {
  const EmployeeListState();
  @override
  List<Object?> get props => [];
}

class EmployeeListInitial extends EmployeeListState {}

class EmployeelistLoading extends EmployeeListState {}

class EmployeelistLoaded extends EmployeeListState {
  final List<EmpModel>? emps;
  final List<EmpModel>? searchEmps;
  const EmployeelistLoaded(this.emps, this.searchEmps);
  @override
  // TODO: implement props
  List<Object?> get props => [emps, searchEmps];
}

class EmployeelistError extends EmployeeListState {
  final String? errorMsg;
  const EmployeelistError(this.errorMsg);
  @override
  // TODO: implement props
  List<Object?> get props => [errorMsg];
}
