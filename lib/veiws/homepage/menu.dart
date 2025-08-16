// veiws/homepage/menu.dart
import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Menu();
  }
}

class _Menu extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: MediaQuery.sizeOf(context).width <600 ?
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 5, left: 10),
                    child: Text(
                      "Word Tech",
                      style: AppTextStyles.style24w700(context).copyWith(color: AppColors.Darkviolet)
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 80,
                      maxHeight: 64
                    ),
                    child: AspectRatio(
                      aspectRatio: 80/64,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/96b22b016cc5390000729839634d8bf5daa71942.png"),
                        backgroundColor: AppColors.White,
                      ),
                    ),
                  ),
                ],
              ) :
                Row(
                children: [
                  Text(
                    "Word Tech",
                    style: AppTextStyles.style24w700(context).copyWith(color: AppColors.Darkviolet)
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 80,
                      maxHeight: 64
                    ),
                    child: AspectRatio(
                      aspectRatio: 80/64,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/96b22b016cc5390000729839634d8bf5daa71942.png"),
                        backgroundColor: AppColors.White,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            width: double.infinity,
            margin: EdgeInsets.only(
              right: MediaQuery.of(context).size.width < 600
                  ? MediaQuery.of(context).size.width / 50
                  : MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width / 95
                  : MediaQuery.of(context).size.width / 95,
              //       top:
              //       MediaQuery.of(context).size.width<600?
              // 5:
              // MediaQuery.of(context).size.width<1200?
              // 8:
              // 10,
            ),
            child: Text(
              "القائمة",
              textDirection: TextDirection.rtl,
              style: AppTextStyles.style20w700(context).copyWith(fontFamily: 'Tajawal', color: AppColors.BabyBlack)
            ),
          ),
        ],
      ),
    );
  }
}
