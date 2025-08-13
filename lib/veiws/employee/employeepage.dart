// veiws/employee/employeepage.dart
import 'package:dashboard/veiws/employee/addingbutton.dart';
import 'package:dashboard/veiws/employee/dialogadding.dart';
import 'package:dashboard/veiws/employee/employeedata.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmployeePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EmployeePage();
  }
}

class _EmployeePage extends State<EmployeePage> {
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Consumer<Signinprovider>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width < 600
                                        ? MediaQuery.of(context).size.width / 1.6
                                        : MediaQuery.of(context).size.width < 1200
                                        ? MediaQuery.of(context).size.width / 1.5
                                        : MediaQuery.of(context).size.width / 1.4,
                                    height: MediaQuery.sizeOf(context).height * 0.9,
                                    child: Employeedata(),
                                  ),
                                  Container(width: 1, color: Colors.black38),
                                ],
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: MediaQuery.of(context).size.width < 600
                                      ? MediaQuery.of(context).size.width / 4
                                      : MediaQuery.of(context).size.width < 900
                                      ? MediaQuery.of(context).size.width / 5
                                      : MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width < 600
                                      ? 40
                                      : MediaQuery.of(context).size.width < 1200
                                      ? 50
                                      : 50,
                                  child: Addingbutton(
                                    textbotton: 'إضافة موظف',
                                    onPressed: () {
                                      dialogadding(
                                        image: '',
                                        context: context,
                                        name: '',
                                        phone: '',
                                        job: "",
                                        index: 1
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                
          ),
        );
      },
    );
  }
}
