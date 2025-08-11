import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/employee/deletingDialog.dart';
import 'package:dashboard/veiws/employee/dialog_editing.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void Showemdata({
  IconData? removeicon,
  required String image,
  required BuildContext context,
  required String name,
  required String phone,
  String? job,
  required int index,
  VoidCallback? onConfirm,
}) {
  
  final TextEditingController nameController = TextEditingController(text: name);
final TextEditingController phoneController = TextEditingController(text: phone);
final TextEditingController jobController = TextEditingController(text: job);
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: 800,
            height: 1000,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 20,
                        child: Icon(Icons.close)
                      ),
                    ),
                    Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return MaterialButton(
                          onPressed: () async {
                            await value.DeleteEmployee(id: int.parse(value.employees['data'][index]['id'].toString()),);
                            DeletingDialog(context: context, index: index);
                          },
                          child: Container(width: 20, child: Icon(removeicon)),
                        );
                      },
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    image: DecorationImage(
                      image: NetworkImage("$image"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width<600?
                              MediaQuery.of(context).size.width/7:
                              MediaQuery.of(context).size.width<1200?
                              MediaQuery.of(context).size.width/4:
                              MediaQuery.of(context).size.width/5, vertical: 20),
                  width: 232,
                  height: 232,
                ),
                Form(
                  child: Container(
                    width: 500,
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: nameController,
                              textDirection: TextDirection.rtl,
                              // enabled: value.enabled,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 0.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                // prefixText: nameController.text,
                                prefixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Colors.black,
                                ),
                                suffixText: "                                                                                  : الإسم",
                                suffixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              textDirection: TextDirection.rtl,
                              controller: phoneController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                // prefixText: phoneController.text,
                                prefixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Color.fromARGB(255, 29, 59, 26),
                                ),
                                suffixText: "                                                                             : رقم الهاتف",
                                suffixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              textDirection: TextDirection.rtl,
                              controller: jobController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                // prefixText: jobController.text,
                                prefixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Color.fromARGB(255, 29, 59, 26),
                                ),
                                suffixText: "                                                                                     :الوظيفة",
                                suffixStyle: TextStyle(
                                  fontFamily: 'AlmaraiR',
                                  fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 12):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 14):
                              getResponsiveScaleFactor(context, fontSize: 16),
                                  color: Colors.grey,
                                ),
                              ),
                            ),

                            Center(
                              child: Container(
                                margin: EdgeInsets.symmetric(vertical: 80),
                                width: 400,
                                height: 56,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: MaterialButton(
                                  onPressed: () async {
                                    dialogeditind(context: context, index: index, name: value.employees['data'][index]['name'], image: '${value.baseurl}/${value.employees['data'][index]['image']}', phone: value.employees['data'][index]['phone'], job: value.employees['data'][index]['job'],);
                                  },
                                  child: Text(
                                    "اضافه موظف",
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 16):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 22):
                              getResponsiveScaleFactor(context, fontSize: 24),
                                      fontFamily: 'Regular',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
