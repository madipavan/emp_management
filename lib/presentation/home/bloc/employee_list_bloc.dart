import 'package:bloc/bloc.dart';
import 'package:employee_management/presentation/model/emp_model.dart';
import 'package:employee_management/service/employees_data_service.dart';
import 'package:equatable/equatable.dart';

part 'employee_list_event.dart';
part 'employee_list_state.dart';

class EmployeeListBloc extends Bloc<EmployeeListEvent, EmployeeListState> {
  EmployeeListBloc() : super(EmployeeListInitial()) {
    on<FetchEmployees>((event, emit) async {
      emit(EmployeelistLoading());
      try {
        final emps = await EmployeesDataService().fetchEmployees();
        emit(EmployeelistLoaded(emps, emps));
      } catch (e) {
        emit(EmployeelistError(e.toString()));
      }
    });
    //seraching emp
    on<SearchEmployees>((event, emit) {
      final currentState = state as EmployeelistLoaded;
      final filteredList = currentState.emps!
          .where(
            (element) => element.name.toString().toLowerCase().contains(
              event.filterVal!,
            ),
          )
          .toList();

      emit(EmployeelistLoaded(currentState.emps, List.from(filteredList)));
    });
  }
}
