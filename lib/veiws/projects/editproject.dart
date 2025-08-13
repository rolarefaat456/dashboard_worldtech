// veiws/projects/editproject.dart
import 'dart:io';
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:path/path.dart' as path;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void Editproject({
  Container? mycontainer,
  required String botton,
  required File image,
  required BuildContext context,
  required String namee,
  required String prjdescription,
  required String advatagess,
  required int index,
  VoidCallback? onConfirm,
}) {
  GlobalKey<FormState> formkey = GlobalKey();
  EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  final prov = Provider.of<Signinprovider>(context, listen: false);
  prov.Projects();
  prov.title.text = namee;
  prov.description.text = prjdescription;

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return SingleChildScrollView(
        child: AlertDialog(
          backgroundColor: Colors.white,
          content: Container(
            width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width/2.3 : MediaQuery.of(context).size.width< 900 ? MediaQuery.of(context).size.width/2 : MediaQuery.of(context).size.width/1.8,
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
                        return Container(child: mycontainer);
                      },
                    ),
                  ],
                ),
                Text(
                  'بيانات المشروع',
                  style: AppTextStyles.style22w400(context),
                ),
                Form(
                  key: formkey,
                  child: Container(
                    width: MediaQuery.of(context).size.width < 600 ? MediaQuery.of(context).size.width/2.5 : MediaQuery.of(context).size.width< 900 ? MediaQuery.of(context).size.width/2.2 : MediaQuery.of(context).size.width/2 ,
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                controller: value.title,
                                style: botton == 'حفظ التعديلات'
                                    ? AppTextStyles.style14w400(context)
                                    : AppTextStyles.style14w400(
                                        context,
                                      ).copyWith(color: AppColors.Grey),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColors.Grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColors.Grey,
                                    ),
                                  ),
                                  suffix: botton == 'حفظ التعديلات'
                                      ? Text(
                                          ": عنوان المشروع",
                                          style: AppTextStyles.style14w400(
                                            context,
                                          ),
                                        )
                                      : null,
                                  hint: botton == 'حفظ التعديلات'
                                      ? null
                                      : Text(
                                          " عنوان المشروع",
                                          textAlign: TextAlign.start,
                                          textDirection: TextDirection.rtl,
                                          style: AppTextStyles.style16w400(
                                            context,
                                          ).copyWith(color: AppColors.Grey),
                                        ),
                                ),
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                maxLines: 9,
                                controller: value.description,

                                textDirection: TextDirection.ltr,
                                textAlign: TextAlign.left,
                                style: botton == 'حفظ التعديلات'
                                    ? AppTextStyles.style14w400(context)
                                    : AppTextStyles.style14w400(
                                        context,
                                      ).copyWith(color: AppColors.Grey),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColors.Grey,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: AppColors.Grey,
                                    ),
                                  ),
                                  suffix: botton == 'حفظ التعديلات'
                                      ? Text(
                                          "\n : الوصف \n",
                                          style: AppTextStyles.style14w400(
                                            context,
                                          ),
                                        )
                                      : null,
                                  hint: botton == 'حفظ التعديلات'
                                      ? null
                                      : Text(
                                          "\n الوصف \n",
                                          textAlign: TextAlign.start,
                                          textDirection: TextDirection.rtl,
                                          style: AppTextStyles.style16w400(
                                            context,
                                          ).copyWith(color: AppColors.Grey),
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 222,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.2,
                                    color: AppColors.GreyDarkMore,
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
                                        style: AppTextStyles.style14w400(
                                          context,
                                        ),
                                      ),
                                    ),
                                    botton == 'حفظ التعديلات'
                                        ? Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
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
                                                  child: ProjectImageData(
                                                    image: image,
                                                  ),
                                                ),
                                              ),
                                              Container(
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
                                                child: ProjectImageData(
                                                  image: image,
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    Spacer(),
                                    LoadingIcon(type: "image"),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              padding: EdgeInsets.all(10),
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
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    child: Text(
                                      "\n : مميزات",
                                      style: AppTextStyles.style14w400(context),
                                    ),
                                  ),

                                  Expanded(
                                    child: ListView.builder(
                                      itemCount:
                                          value.featureControllers.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 4,
                                          ),
                                          child: Row(
                                            children: [
                                              Container(
                                                width:
                                                    MediaQuery.sizeOf(
                                                          context,
                                                        ).width <
                                                        600
                                                    ? MediaQuery.sizeOf(
                                                            context,
                                                          ).width /
                                                          5
                                                    : MediaQuery.sizeOf(
                                                            context,
                                                          ).width <
                                                          900
                                                    ? MediaQuery.sizeOf(
                                                            context,
                                                          ).width /
                                                          4
                                                    : MediaQuery.sizeOf(
                                                            context,
                                                          ).width /
                                                          5,
                                                child: TextFormField(
                                                  controller: value
                                                      .featureControllers[index],
                                                  textDirection:
                                                      TextDirection.rtl,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'الميزة ${index + 1}',
                                                    hintStyle:
                                                        AppTextStyles.style14w400(
                                                          context,
                                                        ),
                                                    border: OutlineInputBorder(

                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            10,
                                                          ),
                                                      borderSide: BorderSide(
                                                        width: 0.5,
                                                        color: AppColors.Grey,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 12,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.close,
                                                  size: 18,
                                                  color: Colors.grey,
                                                ),
                                                onPressed: () {
                                                  value.removeFeatureController(
                                                    index,
                                                  );
                                                },
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  LoadingIcon(type: "advantage"),
                                ],
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
                                    value.ifedit();
                                    if (botton == 'حفظ التعديلات') {
                                      if (formkey.currentState!.validate()) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                        print('start update project');
                                        await value.UpdateProjects(
                                          id: value
                                              .projects['data'][index]['id'],
                                        );
                                        print('end update project');
                                        if (!context.mounted) return;

                                        Navigator.pop(context);
                                        editSuccessDialog.showEditSuccessDialog(
                                          check: value.check,
                                          context,
                                          title:
                                              value.updateProjects['message'],
                                          onpressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }
                                    } else {
                                      if (formkey.currentState!.validate()) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                        print('start add project');
                                        await value.AddProjects();
                                        print('end add project');

                                        Navigator.pop(context);
                                        editSuccessDialog.showEditSuccessDialog(
                                          check: value.check,
                                          context,
                                          title: value.addProjects['message'],
                                          onpressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        );
                                      }
                                    }
                                  },
                                  child: Text(
                                    "${botton}",
                                    textDirection: TextDirection.rtl,
                                    style: AppTextStyles.style20w400(context),
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

class LoadingIcon extends StatelessWidget {
  const LoadingIcon({super.key, required this.type});
  final String type;

  @override
  Widget build(BuildContext context) {
    return Consumer<Signinprovider>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: AppColors.Violet_Blue,
              child: IconButton(
                onPressed: () {
                  if (type == 'image') {
                    value.pickImageFromGallery();
                  } else {
                    value.addFeatureController();
                  }
                },
                icon: Icon(Icons.file_upload_outlined, color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

class ProjectImageData extends StatelessWidget {
  ProjectImageData({super.key, required this.image});

  final File image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.close, size: 10, color: Colors.grey),
        Flexible(
          child: Tooltip(
            message: path.basename(image.path),
            child: SizedBox(
              width: 50,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,

                child: Text(
                  softWrap: false,
                  textDirection: TextDirection.ltr,
                  path.basename(image.path),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.style8w400(context),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
