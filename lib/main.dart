import 'package:employee_management/presentation/home/bloc/employee_list_bloc.dart';
import 'package:employee_management/presentation/home/pages/emp_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<EmployeeListBloc>(create: (context) => EmployeeListBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'employee_management',
        home: EmpListScreen(),
      ),
    );
  }
}
