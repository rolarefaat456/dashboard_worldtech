// veiws/employee/employeedata.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/empty_page.dart';
import 'package:dashboard/veiws/employee/deletingDialog.dart';
import 'package:dashboard/veiws/employee/dialog_editing.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Employeedata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Employeedata();
  }
}

class _Employeedata extends State<Employeedata> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Signinprovider>(context, listen: false).Employees();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,

      body: Consumer<Signinprovider>(
        builder: (context, value, child) {
          return value.employees == null
    ? Center(child: CircularProgressIndicator())
    : (value.employees['data'] is! List || (value.employees['data'] as List).isEmpty)
        ? Center(child: EmptyPage()) 
        : GridView.builder(
                  itemCount: value.employees['data'].length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width < 600
                        ? 2
                        : MediaQuery.of(context).size.width < 1200
                        ? 3
                        : 5,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 250,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(width: 0.5, color: Colors.black38),
                      ),
                      child: InkWell(
                        onTap: () {
                          dialogeditind(context: context, index: index, name: value.employees['data'][index]['name'], image: '${value.baseurl}/${value.employees['data'][index]['image']}', phone: value.employees['data'][index]['phone'], job: value.employees['data'][index]['job'],);
                        },
                        child: Container(
                          width: 100,
                          height: 100,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: SizedBox()),
                                  IconButton(
                                    onPressed: () async {
                                      DeletingDialog(context: context, index: index);
                                    },
                                    icon: Icon(Icons.delete_outline),
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      "${value.baseurl}/${value.employees['data'][index]['image']}",
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 25,
                                  bottom: 15,
                                ),
                                child: Text(
                                  "${value.employees['data'][index]['name']}",
                                  style: AppTextStyles.style16w400(context)
                                      .copyWith(
                                        fontFamily: 'Tajawal',
                                        color: AppColors.SmallerThanTheBigger,
                                      ),
                                ),
                              ),
                              Text(
                                "${value.employees['data'][index]['phone']}",
                                style: AppTextStyles.style16w400(context)
                                    .copyWith(
                                      fontFamily: 'Tajawal',
                                      color: AppColors.DarkerThanDarkGrey,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
