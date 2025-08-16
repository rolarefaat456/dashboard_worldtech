// veiws/projects/deletprjdata.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void deletprjdata({required BuildContext context, required int index}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
          content: Container(
            width: 480,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close)
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Text(
                  "هل ترغب في حذف المشروع من النظام ؟!",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.style16w400(context)
                ),
                Text(
                  "إضغط موافق للتأكيد",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.style16w400(context)
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 80),
                    width: 132,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 48, 48),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return MaterialButton(
                          onPressed: ()  async {
                            await value.DeleteProject(id: value.projects['data'][index]['id']);
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "موافق",
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.style16w400(context).copyWith(color: AppColors.White)
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
      );
    },
  );
}
