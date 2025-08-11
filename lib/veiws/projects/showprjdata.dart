import 'dart:io';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:path/path.dart' as path;

import 'package:dashboard/veiws/employee/deletingDialog.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/projects/editproject.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void Showprjdata({
  required String image,
  required BuildContext context,
  required String name,
  required String prjdescription,
  required String advatages,
  required int index,
  VoidCallback? onConfirm,
}) {
  final TextEditingController nameController = TextEditingController(
    text: name,
  );
  final TextEditingController descriptionController = TextEditingController(
    text: prjdescription,
  );
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: 800,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(width: 20, child: Icon(Icons.close)),
                    ),
                    Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            border: Border.all(width: 0.2, color: Colors.black),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              DeletingDialog(context: context,index: index );
                            },
                            child: Container(
                              width: 20,
                              child: Icon(Icons.delete_outline),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Text(
                  'بيانات المشروع',
                  style: TextStyle(
                    fontFamily: 'Regular',
                    fontSize: MediaQuery.of(context).size.width < 600
                        ? getResponsiveScaleFactor(context, fontSize: 14)
                        : MediaQuery.of(context).size.width < 1200
                        ? getResponsiveScaleFactor(context, fontSize: 20)
                        : getResponsiveScaleFactor(context, fontSize: 22),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Form(
                  child: Container(
                    width: 600,
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Consumer<Signinprovider>(
                                builder: (context, value, child) {
                                  return TextFormField(
                                    controller: nameController,
                                    textDirection: TextDirection.ltr,
                                    enabled: value.enabledpro,
                                    readOnly: value.readonlypro,
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
                                        ": عنوان المشروع",
                                        style: AppTextStyles.style14w400(context),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 20),

                            Container(
                              margin: EdgeInsets.all(20),
                              child: Consumer<Signinprovider>(
                                builder: (context, val, child) {
                                  return TextFormField(
                                    enabled: val.enabledpro,
                                    readOnly: val.readonlypro,
                                    maxLines: 9,
                                    controller: descriptionController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                        horizontal: 16,
                                      ),
                                      suffix: Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                          ": الوصف",
                                          textAlign: TextAlign.end,
                                          style: AppTextStyles.style14w400(context),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),

                            SizedBox(height: 20),

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
                                        color: const Color.fromARGB(
                                          255,
                                          186,
                                          185,
                                          185,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "صورة للمشروع\n",
                                            textAlign: TextAlign.end,
                                            style: AppTextStyles.style14w400(
                                              context,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 24,
                                                  width: 80,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    color: Colors.grey.shade100,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                            mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Icon(
                                                        Icons.close,
                                                        size: 10,
                                                        color: Colors.grey,
                                                      ),
                                                      Flexible(
                                                        child: Tooltip(
                                                          message: path.basename(
                                                            image,
                                                          ),
                                                          child: SizedBox(
                                                            width: 50,
                                                            child: FittedBox(
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                              alignment: Alignment
                                                                  .centerLeft,
                                                        
                                                              child: Text(
                                                                softWrap: false,
                                                                textDirection:
                                                                    TextDirection
                                                                        .ltr,
                                                                path.basename(
                                                                  image,
                                                                ),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style:
                                                                    AppTextStyles.style8w400(
                                                                      context,
                                                                    ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                height: 24,
                                                width: 80,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  // color: Colors.grey.shade400,
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey.shade100,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                          mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      size: 10,
                                                      color: Colors.grey,
                                                    ),
                                                    Flexible(
                                                      child: Tooltip(
                                                        message: path.basename(
                                                          image,
                                                        ),
                                                        child: SizedBox(
                                                          width: 50,
                                                          child: FittedBox(
                                                            fit: BoxFit.scaleDown,
                                                            alignment: Alignment
                                                                .centerLeft,
                                                      
                                                            child: Text(
                                                              softWrap: false,
                                                              textDirection:
                                                                  TextDirection
                                                                      .ltr,
                                                              path.basename(
                                                                image,
                                                              ),
                                                              maxLines: 1,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style:
                                                                  AppTextStyles.style8w400(
                                                                    context,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
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
                                        color: const Color.fromARGB(
                                          255,
                                          186,
                                          185,
                                          185,
                                        ),
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            ": المميزات",
                                            textAlign: TextAlign.end,
                                            style: AppTextStyles.style14w400(
                                              context,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: Container(
                                                  height: 24,
                                                  width: 80,
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    color: Colors.grey.shade100,
                                                  ),
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Icon(
                                                        Icons.close,
                                                        size: 10,
                                                        color: Colors.grey,
                                                      ),
                                                      Text(
                                                        'سرعة الت ...',
                                                        textDirection:
                                                            TextDirection.rtl,
                                                        style: AppTextStyles.style8w400(context),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // value.getImageFromGallery();
                                              },
                                              child: Container(
                                                height: 24,
                                                width: 80,
                                                padding: EdgeInsets.symmetric(
                                                  horizontal: 10,
                                                ),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.grey.shade100,
                                                ),
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Icon(
                                                      Icons.close,
                                                      size: 10,
                                                      color: Colors.grey,
                                                    ),
                                                    Text(
                                                      'سرعة الت ...',
                                                      textDirection:
                                                          TextDirection.rtl,
                                                      style: AppTextStyles.style8w400(context),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ],
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
                                child: MaterialButton(
                                  onPressed: () {
                                    File imageFromAssets = File(
                                      'assets/images/Mobile.png',
                                    );

                                    Navigator.of(context).pop();
                                    Editproject(
                                      context: context,
                                      namee:
                                          value.projects['data'][index]['title'],
                                      prjdescription:
                                          value.projects['data'][index]['description'],
                                      advatagess:
                                          value.projects['data'][index]['feature'].toString(),
                                      index: index,
                                      botton: 'حفظ التعديلات',
                                      mycontainer: Container(
                                        width: 44,
                                        height: 44,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            40,
                                          ),
                                          border: Border.all(
                                            width: 0.2,
                                            color: Colors.black,
                                          ),
                                        ),
                                        child: MaterialButton(
                                          onPressed: () {
                                            DeletingDialog(
                                              context: context, index: index
                                            );
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            width: 20,
                                            child: Icon(Icons.delete_outline),
                                          ),
                                        ),
                                      ),
                                      image: imageFromAssets,
                                    );
                                  },
                                  child: Text(
                                    'تعديل البيانات',
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.style20w400(context)
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
