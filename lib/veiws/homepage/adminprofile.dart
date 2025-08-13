// veiws/homepage/adminprofile.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void ShowAlert({
  required String image,
  required BuildContext context,
  required String name,
  required String phone,
  required int index,
  VoidCallback? onConfirm,
}) {
  final prov = Provider.of<Signinprovider>(context, listen: false);
  prov.first_name = TextEditingController(text: name);
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
            child: Column(
              children: [
                Row(
                  children: [
                    MaterialButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(width: 20, child: Icon(Icons.close)),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Consumer<Signinprovider>(
                  builder: (context, value, child) {
                    return ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 232,
                        maxWidth: 232
                      ),
                      child: value.enabled ? Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.bottomRight,
                        children: [
                          AspectRatio(
                        aspectRatio: 1,
                        child: CircleAvatar(
                            backgroundImage:
                               NetworkImage(
                                image,
                              ),onBackgroundImageError: (exception, stackTrace) {
                                Icon(Icons.broken_image);
                              },
                          )
                        ),
                        IconButton(
                          onPressed: () async {
                            await value.pickImageFromGallery();
                          },
                          icon: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppColors.White,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.Grey
                              )
                            ),
                            child: Icon(Icons.camera_alt_outlined)
                          )
                        )
                        ],
                      )
                      : AspectRatio(
                        aspectRatio: 1,
                        child: CircleAvatar(
                            backgroundImage:
                               NetworkImage(
                                image,
                              ),onBackgroundImageError: (exception, stackTrace) {
                                Icon(Icons.broken_image);
                              },
                        ),
                      )
                    );
                  }
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
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "الإسم :",
                                textDirection: TextDirection.rtl,
                                style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai', color: AppColors.Blue)
                              ),
                            ),
                            value.enabled ? 
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10),
                                    child: TextFormField(
                                      enabled: value.enabled,
                                      readOnly: value.readonly,
                                      controller: value.first_name,
                                      style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(10),
                                          borderSide: BorderSide(width: 0.5),
                                        ),
                                        
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    enabled: value.enabled,
                                    readOnly: value.readonly,
                                    controller: value.last_name,
                                    style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 0.5),
                                      ),
                                      
                                    ),
                                  ),
                                ),
                              ],
                            ):TextFormField(
                                    enabled: value.enabled,
                                    readOnly: value.readonly,
                                    controller: value.first_name,
                                    style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 0.5),
                                      ),
                                      
                                    ),
                                  ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "الايميل :",
                                textDirection: TextDirection.rtl,
                                style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai', color: AppColors.Blue)
                              ),
                            ),
                            TextFormField(
                              controller: value.email,
                              style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                              enabled: value.enabled,
                              readOnly: value.readonly,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: Text(
                                "كلمة المرور :",
                                textDirection: TextDirection.rtl,
                                style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai', color: AppColors.Blue)
                              ),
                            ),
                            value.botton == "حفظ التعديلات" ? Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  child: TextFormField(
                                    enabled: value.enabled,
                                    readOnly: value.readonly,
                                    controller: value.passwordnow,
                                    style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                                    decoration: InputDecoration(
                                      hint: Text(
                                        'current password',
                                        style: AppTextStyles.style14w400(context),
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  enabled: value.enabled,
                                  readOnly: value.readonly,
                                  controller: value.password_confirmation,
                                  style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                                  decoration: InputDecoration(
                                    hint: Text(
                                      'confirmation password',
                                      style: AppTextStyles.style14w400(context),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ],
                            ):
                            TextFormField(
                              enabled: value.enabled,
                              readOnly: value.readonly,
                              controller: value.password,
                              style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai',color: AppColors.DarkGreen),
                              decoration: InputDecoration(
                                hint: Text(
                                  '******',
                                  style: AppTextStyles.style14w400(context),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 80),
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 48, 48, 48),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: MaterialButton(
                                  onPressed: () async {
                                    value.ifedit();
                                    if (value.enabled == false) {
                                      if (formkey.currentState!.validate()) {
                                        showDialog(
                                          context: context,
                                          barrierDismissible: false,
                                          builder: (_) => Center(
                                            child: CircularProgressIndicator(),
                                          ),
                                        );
                                        print('start update profile');
                                        await value.UpdateProfile();
                                        print('updateProfile is ${value.updateProfile}');
                                        print('end update profile');

                                        Navigator.pop(context);
                                      if (value.check)
                                      {
                                        editSuccessDialog.showEditSuccessDialog(
                                          check: value.check,
                                        context,
                                        title: 'تم التعديل بنجاح',
                                        onpressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      }else{
                                        editSuccessDialog.showEditSuccessDialog(
                                          check: value.check,
                                        context,
                                        title: 'فشل التعديل',
                                        onpressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      );
                                      }
                                      
                                    }
                                  }
                                },
                                  child: Text(
                                    "${value.botton}",
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
