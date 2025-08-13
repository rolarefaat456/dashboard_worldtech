// veiws/Auth/signdata.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Signdata extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  EditSuccessDialog editSuccessDialog = EditSuccessDialog();

  @override
  Widget build(BuildContext context) {
    return Consumer<Signinprovider>(
      builder: (context, value, child) {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.sizeOf(context).height,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 5,
                      bottom: MediaQuery.of(context).size.height / 20,
                    ),
                    child: Text(
                      "Sign In",
                      style: AppTextStyles.style24w700(
                        context,
                      ).copyWith(fontFamily: 'Noto_Kufi_Arabic'),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width < 1200
                          ? MediaQuery.of(context).size.width / 3
                          : MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 50,
                      ),
                      child: TextFormField(
                        controller: value.email,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.MorePaleGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.MorePaleGrey,
                            ),
                          ),
                          hintText: "User Email",
                          prefixIcon: Icon(Icons.email_outlined),
                          prefixIconColor: AppColors.Violet_Blue,
                          hintStyle: AppTextStyles.style18w500(context),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.width / 2
                          : MediaQuery.of(context).size.width < 1200
                          ? MediaQuery.of(context).size.width / 3
                          : MediaQuery.of(context).size.width / 4,
                      margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height / 50,
                      ),
                      child: TextFormField(
                        controller: value.password,
                        obscureText: value.obscure,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.MorePaleGrey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: AppColors.MorePaleGrey,
                            ),
                          ),
                          hintText: "Password",
                          prefixIcon: Icon(Icons.lock),
                          prefixIconColor: AppColors.Violet_Blue,
                          hintStyle: AppTextStyles.style18w500(context),
                          suffixIcon: IconButton(
                            onPressed: () {
                              value.isvisibliyoff();
                            },
                            icon: Icon(value.iconData, color: AppColors.Grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(
                        context,
                      ).pushReplacementNamed('Forgetscreen');
                    },
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50,
                        bottom: MediaQuery.of(context).size.height / 10,
                      ),
                      child: Text(
                        "Forgot your password?",
                        style: AppTextStyles.style16w600(context).copyWith(
                          color: AppColors.Violet_Blue,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.Violet_Blue,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 48, 48, 48),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: MaterialButton(
                      onPressed: () async {
                        if (formkey.currentState!.validate()) {
                          await value.login();
                          if (value.check) {
                            editSuccessDialog.showEditSuccessDialog(
                              check: value.check,
                              context,
                              title: 'تم التسجيل بنجاح',
                              onpressed: () => Navigator.of(
                                context,
                              ).pushReplacementNamed('MainPage'),
                            );
                          } else {
                            editSuccessDialog.showEditSuccessDialog(
                              check: value.check,
                              context,
                              title: 'فشل تسجيل الدخول',
                              onpressed: () => Navigator.of(
                                context,
                              ).pop()
                            );
                          }
                        }
                      },
                      child: Text(
                        "Sign In",
                        style: AppTextStyles.style16w600(
                          context,
                        ).copyWith(color: AppColors.White),
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
}
