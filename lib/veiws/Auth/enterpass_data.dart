// veiws/Auth/enterpass_data.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class Enterpass extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  EditSuccessDialog editSuccessDialog = EditSuccessDialog();

  Enterpass({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Form(
      key: formkey,
      child: Column(
        children: [
          Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 30,
                      bottom: MediaQuery.of(context).size.height / 20,
                    ),
                    child: Text(
                      "Enter New Password",
                      style: AppTextStyles.style24w700(
                        context,
                      ).copyWith(fontFamily: 'Noto_Kufi_Arabic'),
                    ),
                  ),
          Container(
            width: MediaQuery.of(context).size.width < 600
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width < 1200
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 4,
                    margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height / 50,
                    ),
            child: Consumer<Signinprovider>(
              builder: (context, value, child) {
                return Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 50,
                      ),
                      child: TextFormField(
                        obscureText: value.obscure1,
                        controller: value.current_password,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter Password",
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: AppColors.Violet_Blue,
                          hintStyle: AppTextStyles.style18w500(context),
                          suffixIcon: IconButton(
                            onPressed: () {
                              value.isvisibliyoff1();
                            },
                            icon: Icon(value.iconData1, color: AppColors.Grey),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: MediaQuery.of(context).size.height / 10,
                      ),
                      child: TextFormField(
                        obscureText: value.obscure2,
                        controller: value.password_confirmation,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Enter New Password",
                          prefixIcon: Icon(Icons.lock),
                          //rgba(100, 128, 247, 1)
                          prefixIconColor: AppColors.Violet_Blue,
                          hintStyle: AppTextStyles.style18w500(context),
                          suffixIcon: IconButton(
                            onPressed: () {
                              value.isvisibliyoff2();
                            },
                            icon: Icon(value.iconData2, color: AppColors.Grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
                  padding: EdgeInsets.symmetric(
                    
                    horizontal: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 90
                      : MediaQuery.of(context).size.width < 1200
                      ? MediaQuery.of(context).size.width / 90
                      : MediaQuery.of(context).size.width / 95,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.BabyBlack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Consumer<Signinprovider>(
                    builder: (context, value, child) {
                      return MaterialButton(
                        onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          await value.Reset();
                          if (value.check) {
                            editSuccessDialog.showEditSuccessDialog(
                              check: value.check,
                              context,
                              title: "تم إرسال الكود بنجاح",
                              onpressed: () {},
                            );
                          } else {
                            editSuccessDialog.showEditSuccessDialog(
                              check: value.check,
                              context,
                              title: "فشل ارسال الكود ${value.reset['message']}",
                              onpressed: () {},
                            );
                          }
                        }
                      
                        Navigator.of(context).pushReplacementNamed('MainPage');
                      },
                        child: Text(
                          "Ok",
                          style: AppTextStyles.style16w600(context).copyWith(color: AppColors.White)
                        ),
                      );
                    }
                  ),
                ),
          
        ],
      ),
    );
  }
}
