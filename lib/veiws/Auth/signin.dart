// veiws/Auth/signin.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/Auth/signdata.dart';
import 'package:dashboard/veiws/Auth/textappbar.dart';
import 'package:flutter/material.dart';

class Signin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Signin();
  }
}

class _Signin extends State<Signin> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          color: AppColors.Black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                // phone image
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: MediaQuery.of(context).size.height,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/images/4bdc69648c9740dc05358d7b6c4269b68d0f274a copy.jpg",
                          ),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // appbar
                            Container(
                              padding: EdgeInsets.all(1),
                              child: Textappbar(),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 1.7,
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    // تدريج الالوان في النص
                                    LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(255, 153, 153, 153),
                                      ],
                                    ).createShader(
                                      Rect.fromLTWH(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ),
                                    ),
                                child: FittedBox(
                                  clipBehavior: Clip.antiAlias,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "welcome back !",
                                    style: AppTextStyles.style46w700(context),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: ShaderMask(
                                shaderCallback: (bounds) =>
                                    LinearGradient(
                                      colors: [
                                        Color.fromARGB(255, 255, 255, 255),
                                        Color.fromARGB(255, 153, 153, 153),
                                      ],
                                    ).createShader(
                                      Rect.fromLTWH(
                                        0,
                                        0,
                                        bounds.width,
                                        bounds.height,
                                      ),
                                    ),
                                child: FittedBox(
                                  clipBehavior: Clip.antiAlias,
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    "Mohammed Hanafy",
                                    style: AppTextStyles.style46w700(context),
                                  ),
                                ),
                              ),
                            ),
                            FittedBox(
                              clipBehavior: Clip.antiAlias,
                              fit: BoxFit.scaleDown,
                              child: Text(
                                "Manage World Tech Company Easy & Safe",
                                style: AppTextStyles.style20w400(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Signdata(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
