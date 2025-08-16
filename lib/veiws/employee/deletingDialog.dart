// veiws/employee/deletingDialog.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void DeletingDialog({required BuildContext context, required int index}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white,
          content: Container(
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
                      icon: Icon(Icons.close),
                    ),
                    Expanded(child: SizedBox()),
                  ],
                ),
                Text(
                  "هل ترغب في حذف الموظف من النظام ؟!",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Tajawal')
                ),
                Text(
                  "إضغط موافق للتأكيد",
                  textDirection: TextDirection.rtl,
                  style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Tajawal')
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 80),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 48, 48),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Consumer<Signinprovider>(
                      builder: (context, value, child) {
                        return MaterialButton(
                          onPressed: () async {
                            await value.DeleteEmployee(id: value.employees['data'][index]['id']);
                            Navigator.of(context).pop();
                            // value.delete(index);
                            // showEditSuccessDialog(context, title: 'تم الحذف بنجاح');
                          },
                          child: Text(
                            "موافق",
                            textDirection: TextDirection.rtl,
                            style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Tajawal', color: AppColors.White)
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
