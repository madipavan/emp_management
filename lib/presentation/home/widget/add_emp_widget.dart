import 'package:employee_management/presentation/home/bloc/employee_list_bloc.dart';
import 'package:employee_management/presentation/home/widget/custom_text_field.dart';
import 'package:employee_management/presentation/model/emp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddEmpWidget extends StatelessWidget {
  AddEmpWidget({super.key});
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _fullName = TextEditingController();
  final TextEditingController _jobPosition = TextEditingController();
  final TextEditingController _department = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Form(
        key: _formkey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Add New Employee',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text('Full Name'),
            SizedBox(height: 10),
            Expanded(
              child: CustomTextField(
                hint: 'Full Name',
                prefix: Icon(Icons.person),
                controller: _fullName,
              ),
            ),

            Text('Job Position'),
            SizedBox(height: 10),
            Expanded(
              child: CustomTextField(
                hint: 'job position',
                prefix: Icon(Icons.person),
                controller: _jobPosition,
              ),
            ),

            Text('Department'),
            SizedBox(height: 10),
            Expanded(
              child: CustomTextField(
                hint: 'Department',
                prefix: Icon(Icons.person),
                controller: _department,
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(12),
                  ),
                ),
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    context.read<EmployeeListBloc>().add(
                      AddEmployee(
                        EmpModel(
                          createdAt: DateTime.now().toString(),
                          name: _fullName.text.toString().toLowerCase().trim(),
                          avatar: '',
                          emailId: '',
                          mobile: '',
                          country: 'INDIA',
                          state: "MH",
                          district: "",
                          id: '',
                          position: _jobPosition.text
                              .toString()
                              .toLowerCase()
                              .trim(),
                          department: _department.text
                              .toString()
                              .toLowerCase()
                              .trim(),
                        ),
                      ),
                    );
                  }
                },
                child: Text('Add', style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
