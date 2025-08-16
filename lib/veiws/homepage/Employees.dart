// veiws/homepage/Employees.dart
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/homepage/announcement.dart';
import 'package:dashboard/veiws/homepage/employee_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Employees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(
        MediaQuery.of(context).size.width < 600
            ? MediaQuery.of(context).size.width / 99
            : MediaQuery.of(context).size.width < 1200
            ? MediaQuery.of(context).size.width / 99
            : MediaQuery.of(context).size.width / 99,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black38, width: 1),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: detailes(text: "الموظفين", icon: Icons.person_outline),
              ),
            ],
          ),
          Consumer<Signinprovider>(
            builder: (context, value, child) {
              print("Employees data: ${value.employees}");
              return value.employees == null
                  ? Center(child: CircularProgressIndicator())
                  : value.employees?['data'] == null ||
                        value.employees?['data'].isEmpty
                  ? Center(child: Text("لا يوجد موظفين"))
                  : Expanded(
                      child: ListView.builder(
                        itemCount: value.employees?['data']?.length,
                        itemBuilder: (context, index) {
                          return DataEmployee(
                            title:
                                value.employees?['data']?[index]?['name'] ??
                                "بدون اسم",
                            subtitle:
                                value.employees?['data']?[index]?['phone'] ??
                                "—",
                            image:
                                '${value.baseurl}/${value.employees?['data']?[index]?['image']}',
                          );
                        },
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
