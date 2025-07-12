import 'package:bloc/bloc.dart';
import 'package:employee_management/presentation/model/emp_model.dart';
import 'package:employee_management/service/employees_data_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc() : super(EmployeeListInitial()) {
    on<FetchEmployees>((event, emit) async {
      emit(EmployeelistLoading());
      try {
        final emps = await EmployeesDataService().fetchEmployees();
        emit(EmployeelistLoaded(emps: emps, searchEmps: emps));
      } catch (e) {
        emit(EmployeelistError(e.toString()));
      }
    });
    //seraching emp
    on<SearchEmployees>((event, emit) {
      final currentState = state as EmployeelistLoaded;
      final filteredList = List<EmpModel>.from(currentState.emps!)
          .where(
            (element) => element.name.toString().toLowerCase().contains(
              event.filterVal!,
            ),
          )
          .toList();

      emit(
        EmployeelistLoaded(searchEmps: filteredList, emps: currentState.emps),
      );
    });
    //adding emp
    on<AddEmployee>((event, emit) async {
      try {
        final hasAdded = await EmployeesDataService().addEmployee(event.emp!);
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
