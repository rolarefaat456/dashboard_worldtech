import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Swapping extends StatelessWidget {
  Color color = AppColors.White;
  int selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Expanded(
          child: Container(
            width: 450,
            height: 400,
            child: Consumer<Signinprovider>(
              builder: (context, value, child) {
                return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: false,
              itemCount: 4,
              itemBuilder: (context, index) {
                // bool isSelected = value.currentindex == index;
                return Container(
                  margin: EdgeInsets.only(bottom: 25),
                  child: MaterialButton(
                    onPressed: () {
                      
                      // Navigator.of(context).pushReplacementNamed("${dataswap[index]['Name']}");
                      //rgba(242, 241, 237, 1)
                      value.selectingbotton(index);
                      // value.colorr(index);
                    },
                    child: Container(
                      // color: value.color,
                      // color: isSelected
                          // ? Color.fromARGB(255, 242, 241, 137)
                          // : Color.fromARGB(255, 255, 255, 255),
                      width: 300,
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "${dataswap[index]['Title']}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.width<600?
                              getResponsiveScaleFactor(context, fontSize: 10):
                              MediaQuery.of(context).size.width<1200?
                              getResponsiveScaleFactor(context, fontSize: 16):
                              getResponsiveScaleFactor(context, fontSize: 18),
                              fontFamily: 'Regular',
                              //rgba(48, 48, 48, 1)
                              color: Color.fromARGB(255, 48, 48, 48),
                            ),
                          ),
                          Icon(dataicon[index]['Icon']),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
              },
            ),
          )
        ),
      ],
    );
  }
}

  List dataswap = [
    {'Title': "الصفحة الرئيسية", 'Name': 'HomePage'},
    {'Title': "الموظفين", 'Name': 'Employee'},
    {'Title': "المشاريع", 'Name': 'Projectpage'},
    {'Title': "ال Banner الإعلاني", 'Name': 'Bannerpage'},
  ];

  List<Map<String, IconData>> dataicon = [
    {'Icon': Icons.home_outlined},
    {'Icon': Icons.person_outline},
    {'Icon': Icons.devices_outlined},
    {'Icon': Icons.brush_outlined},
  ];
