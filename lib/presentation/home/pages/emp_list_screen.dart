import 'package:employee_management/core/theme/app_colors.dart';
import 'package:employee_management/presentation/home/bloc/employee_list_bloc.dart';
import 'package:employee_management/presentation/model/emp_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmpListScreen extends StatefulWidget {
  const EmpListScreen({super.key});

  @override
  State<EmpListScreen> createState() => _EmpListScreenState();
}

class _EmpListScreenState extends State<EmpListScreen> {
  @override
  void initState() {
    context.read<EmployeeListBloc>().add(FetchEmployees());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBg,
      floatingActionButton: _floatingActionButton(context),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        surfaceTintColor: Colors.blue,
        leading: Icon(Icons.arrow_back_ios),
        title: Text('Employee list'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        child: ListView(
          children: [
            Row(children: [_customSearchField(context)]),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: 500),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
                child: BlocBuilder<EmployeeListBloc, EmployeeListState>(
                  builder: (context, state) {
                    if (state is EmployeelistLoaded) {
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: state.searchEmps!.length,
                        itemBuilder: (context, index) {
                          return _empListTile(state.searchEmps![index]);
                        },
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 15),
                      );
                    } else if (state is EmployeelistLoading) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is EmployeelistError) {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Error In Loading Data')),
                      // );
                      return Text('Error');
                    } else {
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   SnackBar(content: Text('Error In Loading Data')),
                      // );
                      return Text('Error');
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _customSearchField(BuildContext context) {
  return Expanded(
    flex: 1,
    child: TextFormField(
      onChanged: (value) {
        context.read<EmployeeListBloc>().add(
          SearchEmployees(value.toString().toLowerCase().trim()),
        );
      },
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        suffixIcon: IconButton(onPressed: () {}, icon: Icon(Icons.cancel)),
        filled: true,
        fillColor: Colors.white,
        contentPadding: EdgeInsets.all(0),
        hintText: 'Search employees..',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
    ),
  );
}

Widget _floatingActionButton(BuildContext context) {
  return SizedBox(
    width: 140,
    child: FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: () {
        Scaffold.of(context).showBottomSheet((context) {
          return Text('data');
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Icon(Icons.person_add_alt_1, color: Colors.white),
            Spacer(),
            Text('Add Employee', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    ),
  );
}

Widget _empListTile(EmpModel emp) {
  return ListTile(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    tileColor: Colors.white,
    leading: ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(50),
      child: Image.network(emp.avatar),
    ),
    title: Text(
      emp.name,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    subtitle: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          emp.position,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        Text(
          emp.department,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade800),
        ),
      ],
    ),

    trailing: IconButton(
      style: IconButton.styleFrom(
        backgroundColor: Colors.grey.shade300,
        minimumSize: Size(8, 8),
      ),
      onPressed: () {},
      icon: Icon(
        Icons.arrow_forward_ios,
        size: 12,
        weight: 18,
        color: Colors.grey.shade800,
      ),
    ),
  );
}
