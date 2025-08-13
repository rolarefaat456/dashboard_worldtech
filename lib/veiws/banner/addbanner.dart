// veiws/banner/addbanner.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

void Addbanner({
  required String botton,
  required BuildContext context,
  VoidCallback? onConfirm,
}) {
  EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: 500,
            height: 700,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(width: 20, child: Icon(Icons.close)),
                    ),
                    SizedBox(width: 280),
                  ],
                ),
                Text(
                  'إضافة إعلان',
                  style: AppTextStyles.style22w400(context)
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  child: Consumer<Signinprovider>(
                    builder: (context, value, child) {
                      return Container(
                        padding: EdgeInsets.all(10),
                        width: 600,
                        height: 222,
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 0.2,
                            color: const Color.fromARGB(255, 186, 185, 185),
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "صورة للمشروع\n",
                                textAlign: TextAlign.end,
                                style: AppTextStyles.style14w400(context)
                              ),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.end,
                            //   children: [
                            //     Padding(
                            //       padding: const EdgeInsets.all(8.0),
                            //       child: Container(
                            //         height: 24,
                            //         width: 80,
                            //         padding: EdgeInsets.symmetric(
                            //           horizontal: 10,
                            //         ),
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(10),
                            //           color: Colors.grey.shade100,
                            //         ),
                            //         alignment: Alignment.centerRight,
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.Violet_Blue,
                                  child: IconButton(
                                    onPressed: () {
                                      value.pickImageFromGallery();
                                    },
                                    icon: Icon(
                                      Icons.file_upload_outlined,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
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
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return  MaterialButton(
                          onPressed: () async {
                            await value.AddBanner(context);
                            print('add banner is ${value.addbannerapi}');
                            if (value.check) {
                              editSuccessDialog.showEditSuccessDialog(
                                check: value.check,
                              context,
                              title: 'تمت الاضافه بنجاح',
                              onpressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                            }else{
                              editSuccessDialog.showEditSuccessDialog(
                                check: value.check,
                              context,
                              title: 'لم تتم الاضافه',
                              onpressed: () {
                                Navigator.of(context).pop();
                              },
                            );
                            }
                            
                          },
                          child: Text(
                            "${botton}",
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.style20w400(context)
                          ),
                        );
                      }
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
