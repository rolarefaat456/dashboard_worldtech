import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Forgetdata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Forgetdata();
  }
}

class _Forgetdata extends State<Forgetdata> {
  EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Signinprovider>(
      builder: (context, val, child) {
        return SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 3.5,
                    bottom: MediaQuery.of(context).size.height / 20,
                  ),
                  child: Text(
                    "Reset Password",
                    style: AppTextStyles.style24w700(
                      context,
                    ).copyWith(fontFamily: 'Noto_Kufi_Arabic'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 30,
                    bottom: MediaQuery.of(context).size.height / 40,
                  ),
                  child: Text(
                    "Enter your email",
                    style: AppTextStyles.style16w600(
                      context,
                    ).copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width < 600
                        ? MediaQuery.of(context).size.width / 2
                        : MediaQuery.of(context).size.width < 1200
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 4,
                        margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height / 5,
                  ),
                    child: TextFormField(
                      controller: val.email,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.MorePaleGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.MorePaleGrey),
                        ),
                        prefixIcon: Icon(Icons.phone_outlined),
                        prefixIconColor: AppColors.Violet_Blue,
                        hintText: "Phone Number",
                        hintStyle: AppTextStyles.style18w500(context)
                      ),
                    ),
                  ),
                ),
                Container(
                  // width: 
                  padding: EdgeInsets.symmetric(
                    // vertical: MediaQuery.of(context).size.height/90,
                    horizontal: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 85
                      : MediaQuery.of(context).size.width < 1200
                      ? MediaQuery.of(context).size.width / 90
                      : MediaQuery.of(context).size.width / 95,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.BabyBlack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: val.isLoading
                        ? null
                        : () async {
                            if (formkey.currentState!.validate()) {
                              await val.forgetpassword();
                              if (val.check) {
                                editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title: "تم إرسال الكود بنجاح",
                                  onpressed: () => Navigator.of(
                                    context,
                                  ).pushNamed('ForgetPageTwo'),
                                );
                              } else {
                                editSuccessDialog.showEditSuccessDialog(
                                  context,
                                  title:
                                      "فشل ارسال الكود ${val.forget['message']}",
                                  onpressed: () => Navigator.of(
                                    context,
                                  ).pushNamed('Forgetscreen'),
                                );
                              }
                            }
                          },
                    child: val.isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "Ok",
                            style: AppTextStyles.style16w600(context).copyWith(color: AppColors.White)
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
}
