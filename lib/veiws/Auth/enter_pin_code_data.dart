import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/components/widgets/animationadding.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class Pagetwodata extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Pagetwodata();
  }
}

class _Pagetwodata extends State<Pagetwodata> {
  EditSuccessDialog editSuccessDialog = EditSuccessDialog();
  late List<FocusNode> focusNodes;

  @override
  void initState() {
    super.initState();

    focusNodes = List.generate(4, (_) => FocusNode());
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Consumer<Signinprovider>(
      builder: (context, value, child) {
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
                    "Enter PIN Code",
                    style: AppTextStyles.style16w600(
                      context,
                    ).copyWith(decoration: TextDecoration.underline),
                  ),
                ),
                
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 2
                      : MediaQuery.of(context).size.width < 1200
                      ? MediaQuery.of(context).size.width / 3
                      : MediaQuery.of(context).size.width / 4,
                  child: GridView.builder(
                    itemCount: 4,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisExtent: 75,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        width: 64,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.MorePaleGrey),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: AppColors.MorePaleGrey),
                        ),
                            hintText: "*",
                            hintStyle: AppTextStyles.style32w700(context),
                            counterText: '',
                          ),
                          maxLength: 1,
                          controller: value.opts[index],
                          focusNode: focusNodes[index],
                          onChanged: (value) {
                            if (value.isNotEmpty && index < 3) {
                              FocusScope.of(
                                context,
                              ).requestFocus(focusNodes[index + 1]);
                            } else if (value.isEmpty && index > 0) {
                              FocusScope.of(
                                context,
                              ).requestFocus(focusNodes[index - 1]);
                            }
                          },
                        ),
                      );
                    },
                  ),
                ),
                Consumer<Signinprovider>(
                  builder: (context, value, child) {
                    return InkWell(
                      onTap: () async {
                        if (formkey.currentState!.validate()) {
                          await value.ResendCode();
                          if (value.check) {
                            editSuccessDialog.showEditSuccessDialog(
                              context,
                              title: "تم إرسال الكود بنجاح",
                              onpressed: () {},
                            );
                          } else {
                            editSuccessDialog.showEditSuccessDialog(
                              context,
                              title:
                                  "فشل ارسال الكود ${value.resendCode['message']}",
                              onpressed: () {},
                            );
                          }
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height / 7,
                        ),
                        child: Text(
                          "Resend the Code",
                          style: TextStyle(
                            //rgba(100, 128, 247, 1)
                            color: Color.fromARGB(255, 100, 128, 247),
                            fontSize: MediaQuery.of(context).size.width < 600
                                ? getResponsiveScaleFactor(context, fontSize: 14)
                                : MediaQuery.of(context).size.width < 1200
                                ? getResponsiveScaleFactor(context, fontSize: 14)
                                : getResponsiveScaleFactor(context, fontSize: 16),
                            fontFamily: 'Noto_Kufi',
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Container(
                  // width: 
                  padding: EdgeInsets.symmetric(
                    // vertical: MediaQuery.of(context).size.height/90,
                    horizontal: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 85
                      : MediaQuery.of(context).size.width < 1200
                      ? MediaQuery.of(context).size.width /90
                      : MediaQuery.of(context).size.width / 95,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.BabyBlack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: MaterialButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await value.verify();
                        if (value.check) {
                          editSuccessDialog.showEditSuccessDialog(
                            context,
                            title: 'تم التسجيل بنجاح',
                            onpressed: () => Navigator.of(
                              context,
                            ).pushReplacementNamed('ForgetPageThree'),
                          );
                        } else {
                          editSuccessDialog.showEditSuccessDialog(
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
