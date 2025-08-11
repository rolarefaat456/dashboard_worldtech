import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/employee/deletingDialog.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void dialogadding({
  IconData? removeicon,
  required String image,
  required BuildContext context,
  required String name,
  required String phone,
  String? job,
  VoidCallback? onConfirm,
  required int index
}) {
GlobalKey<FormState> formkey = GlobalKey();
EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            // width: 800,
            // height: 1000,
            child: Column(
              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)
                    ),
                    Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return MaterialButton(
                          onPressed: () {
                            DeletingDialog(context: context, index: index);
                          },
                          child: Container(width: 20, child: Icon(removeicon)),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  'إضافة موظف',
                  style: AppTextStyles.style24w400(context),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(500),
                    border: Border.all(width: 0.2,color: Colors.black)
                  ),
                  margin: EdgeInsets.symmetric(horizontal:
                  MediaQuery.of(context).size.width<600?
                              MediaQuery.of(context).size.width/50:
                              MediaQuery.of(context).size.width<1200?
                              MediaQuery.of(context).size.width/60:
                              MediaQuery.of(context).size.width/70,
                  vertical: 20),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                        maxHeight: 232,
                        maxWidth: 232
                      ),
                    child: Stack(
                      children: [
                        AspectRatio(
                          aspectRatio: 1,
                          child: CircleAvatar(
                            
                            backgroundColor: Colors.white,
                            child: Icon(CupertinoIcons.person,size: 60,),
                          ),
                        ),
                        Positioned(
                            top: 180,
                            left: 180,
                            child: Container(
                              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(500),
                      border: Border.all(width: 0.2,color: Colors.black)
                    ),
                              child: Consumer<Signinprovider>(
                                builder: (context, value, child) {
                                  return CircleAvatar(
                                  backgroundColor: Colors.white,
                                  child: IconButton(
                                    onPressed: () {
                                      value.pickImageFromGallery();
                                    },
                                    icon: Icon(Icons.add)
                                  ),
                                );
                                },
                              ),
                            )
                        )
                      ],
                    ),
                  ),
                ),
                Form(
                  key: formkey,
                  child: Container(
width: MediaQuery.sizeOf(context).width < 600
                    ?MediaQuery.sizeOf(context).width/1.5
                    :MediaQuery.sizeOf(context).width < 900
                    ?MediaQuery.sizeOf(context).width/2
                    :MediaQuery.sizeOf(context).width/2.5,                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: value.username,
                              textDirection: TextDirection.rtl,
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
                                label: Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width<600?
                              MediaQuery.of(context).size.width/1.9:
                              MediaQuery.of(context).size.width<1200?
                              MediaQuery.of(context).size.width/4:
                              MediaQuery.of(context).size.width/5,
                              ),
                                  child: Text(
                                    "أدخل إسم الموظف",
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.style18w400(context).copyWith(color: AppColors.Grey)
                                  ),
                                ),
                                
                              )
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              textAlign: TextAlign.right,
                              textDirection: TextDirection.ltr,
                              controller: value.employeephone,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                label: Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width<600?
                              MediaQuery.of(context).size.width/1.9:
                              MediaQuery.of(context).size.width<1200?
                              MediaQuery.of(context).size.width/4:
                              MediaQuery.of(context).size.width/5,),
                                  child: Text(
                                    "أدخل رقم الهاتف",
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.style18w400(context).copyWith(color: AppColors.Grey)
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              textDirection: TextDirection.rtl,
                              controller: value.employeejob,
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
                                label: Container(
                                  margin: EdgeInsets.only(left: MediaQuery.of(context).size.width<600?
                              MediaQuery.of(context).size.width/1.9:
                              MediaQuery.of(context).size.width<1200?
                              MediaQuery.of(context).size.width/4:
                              MediaQuery.of(context).size.width/5,),
                                  child: Text(
                                    "أدخل الوظيفة",
                                    textAlign: TextAlign.right,
                                    style: AppTextStyles.style18w400(context).copyWith(color: AppColors.Grey)
                                  ),
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
                                    if ( formkey.currentState!.validate()){
                                      showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (_) => Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                                  await value.AddEmployee();
                                  Navigator.pop(context);
                                    editSuccessDialog.showEditSuccessDialog(context, title: value.employees['message'], onpressed: () {
                                      Navigator.of(context).pop();
                                    },);
                                    await value.Employees();                                    }
                                  },
                                  child: Text(
                                    "إضافة الموظف",
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
