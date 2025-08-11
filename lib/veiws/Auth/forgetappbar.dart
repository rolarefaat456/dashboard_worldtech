import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/Auth/textappbar.dart';
import 'package:flutter/material.dart';

class Forgetappbar extends StatefulWidget {
  @override
  State<Forgetappbar> createState() => _ForgetappbarState();
}

class _ForgetappbarState extends State<Forgetappbar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Opacity(
                opacity: 0.2,
                child: Container(
                  width: 143,
                  height: 143,
                  child: Image.asset(
                    "assets/images/8e98292dd204dc6c96f366fc80a3374404c2ccf7.png",
                  ),
                ),
              ),
              Container(padding: EdgeInsets.all(15), child: Textappbar()),
            ],
          ),
          Expanded(child: SizedBox()),
          Container(
            color: AppColors.Blue,
            child:  TextButton(
              style: TextButton.styleFrom(
      padding: EdgeInsets.all(50),
    ),
              onPressed: () {
              Navigator.of(context).pushReplacementNamed('Signin');
            },
            child: Text(
              "Back to Sign in",
              style: AppTextStyles.style20w700(
                context,
              ).copyWith(decoration: TextDecoration.underline),
            ),
          ),
          )
        ],
      ),
    );
  }
}
