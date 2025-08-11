import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Logout extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Logout();
  }
}

class _Logout extends State<Logout> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
        children: [
          Divider(
            color: AppColors.Grey,
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacementNamed('Signin');
                    },
                    child: Text(
                      "تسجيل الخروج",
                      style: AppTextStyles.style18w400(context).copyWith(fontFamily: 'Almarai')
                    ),
                  ),
                  Icon(Icons.output),
                ],
              ),
            ),
          ),
        ],
      );
      },
    );
  }
}
