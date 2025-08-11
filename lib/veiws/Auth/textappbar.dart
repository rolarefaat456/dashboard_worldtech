import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

class Textappbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.of(context).size.width < 600 ?
      Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            top:  20,
            // 30, //MediaQuery.of(context).size.width * 0.01,

            left: MediaQuery.of(context).size.width<600?
            MediaQuery.of(context).size.width /30
            : MediaQuery.of(context).size.width<1200?
            MediaQuery.of(context).size.width / 55
            : MediaQuery.of(context).size.width/60,

            right: MediaQuery.of(context).size.width<600?
            MediaQuery.of(context).size.width /85
            : MediaQuery.of(context).size.width<1200?
            MediaQuery.of(context).size.width / 90
            : MediaQuery.of(context).size.width/95,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 56,
              maxWidth: 56
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                "assets/images/8e98292dd204dc6c96f366fc80a3374404c2ccf7.png",
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5),
          child: Text(
            "World Tech",
            style: AppTextStyles.style24w700(context).copyWith(fontFamily: 'Almarai', fontWeight: FontWeight.bold)
          ),
        ),
      ],
    )
      : Row(
      children: [
        Container(
          margin: EdgeInsets.only(
            top:  20,
            // 30, //MediaQuery.of(context).size.width * 0.01,

            left: MediaQuery.of(context).size.width<600?
            MediaQuery.of(context).size.width /30
            : MediaQuery.of(context).size.width<1200?
            MediaQuery.of(context).size.width / 55
            : MediaQuery.of(context).size.width/60,

            right: MediaQuery.of(context).size.width<600?
            MediaQuery.of(context).size.width /85
            : MediaQuery.of(context).size.width<1200?
            MediaQuery.of(context).size.width / 90
            : MediaQuery.of(context).size.width/95,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 56,
              maxWidth: 56
            ),
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset(
                "assets/images/8e98292dd204dc6c96f366fc80a3374404c2ccf7.png",
              ),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            top: 20, 
          ),
          child: Text(
            "World Tech",
            style: AppTextStyles.style24w700(context).copyWith(fontFamily: 'Almarai')
          ),
        ),
      ],
    );
  }
}
