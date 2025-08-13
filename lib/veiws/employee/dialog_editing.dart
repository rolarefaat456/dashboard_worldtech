// veiws/employee/dialog_editing.dart
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/employee/deletingDialog.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void dialogeditind({
  required String name, required String image, required String phone, required String job,
  required BuildContext context,
  VoidCallback? onConfirm,
  required index
}) {
GlobalKey<FormState> formkey = GlobalKey();
EditSuccessDialog editSuccessDialog = EditSuccessDialog();
final prov = Provider.of<Signinprovider>(context, listen: false);
  prov.Employees();
  prov.employeename.text = name;
  prov.employeejobb.text = job;
  prov.employeephone.text = phone;
  // prov.employeename.text = name;

  showDialog(
    // barrierColor: Colors.white,
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
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
                          child: Container(width: 20, child: Icon(Icons.delete_outline)),
                        );
                      },
                    ),
                  ],
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
                            backgroundImage: NetworkImage(image),
                            backgroundColor: Colors.white,
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
                    :MediaQuery.sizeOf(context).width/2.5,
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              controller: value.employeename,
                              style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(width: 0.5),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                suffix: Text(
                                  'الإسم :',
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
                                )
                              )
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              controller: value.employeephone,
                              style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                               suffix: Text(
                                  'رقم الهاتف :',
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
                                ),
                              ),
                            ),

                            SizedBox(height: 20),

                            TextFormField(
                              controller: value.employeejobb,
                              style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 20,
                                ),
                                suffix: Text(
                                  'الوظيفة :',
                                  textDirection: TextDirection.rtl,
                                  style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai'),
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
                                  await value.UpdateEmployee(id: value.employees['data'][index]['id']);
                                  Navigator.pop(context);
                                    editSuccessDialog.showEditSuccessDialog(context,check: value.check, title: value.updateEmployee['message'], onpressed: () {
                                      Navigator.of(context).pop();
                                    },);
                                    }
                                  },
                                  child: Text(
                                    'تعديل بيانات الحساب',
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.style20w400(context).copyWith(fontFamily: 'Tajawal')
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
