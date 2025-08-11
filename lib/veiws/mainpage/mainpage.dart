import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/veiws/banner/bannerpage.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/employee/employeepage.dart';
import 'package:dashboard/veiws/homepage/appbar.dart';
import 'package:dashboard/veiws/homepage/homepage.dart';
import 'package:dashboard/veiws/homepage/logout.dart';
import 'package:dashboard/veiws/homepage/menu.dart';
import 'package:dashboard/veiws/homepage/swapping.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/projects/projectpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Mainpage extends StatefulWidget {
  // final String title;

  // const Mainpage({super.key, required this.title});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Mainpage();
  }
}

class _Mainpage extends State<Mainpage> {
  @override
  Widget build(BuildContext context) {
    double heightscreen = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Signinprovider>(
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                flex: MediaQuery.of(context).size.width < 600
                    ? 3
                    : MediaQuery.of(context).size.width < 1200
                    ? 4
                    : 6,
                child: Column(
                  children: [
                    // appbar
                    Container(child: Appbarr(title: value.titlename())),
                    // page data
                    Expanded(
                      child: Container(child: buildPage(value.selectindex)),
                    ),
                  ],
                ),
              ),
              VerticalDivider(),
              // like drawer in right
              Expanded(
                flex: 1,
                child: Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(
                          MediaQuery.of(context).size.width < 600
                              ? MediaQuery.of(context).size.width / 90
                              : MediaQuery.of(context).size.width < 1200
                              ? MediaQuery.of(context).size.width / 95
                              : MediaQuery.of(context).size.width / 99,
                        ),
                        height: MediaQuery.of(context).size.width < 600
                            ? heightscreen / 6
                            : MediaQuery.of(context).size.width < 1200
                            ? heightscreen / 7
                            : heightscreen / 6.5,
                        child: Menu(),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            bool isSelected = value.selectindex == index;
                            return Container(
                              margin: EdgeInsets.only(bottom: 5),
                              child: MaterialButton(
                                onPressed: () {
                                  value.selecting(index);
                                  // value.colorr(index);
                                },

                                child: AnimatedContainer(
                                  duration: Duration(seconds: 1),
                                  curve: Curves.bounceOut,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.DarkWhite
                                        : AppColors.White,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(
                                          MediaQuery.of(context).size.width <
                                                  600
                                              ? MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    90
                                              : MediaQuery.of(
                                                      context,
                                                    ).size.width <
                                                    1200
                                              ? MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    95
                                              : MediaQuery.of(
                                                      context,
                                                    ).size.width /
                                                    99.9,
                                        ),
                                        child: Text(
                                          "${dataswap[index]['Title']}",
                                          textDirection: TextDirection.rtl,
                                          style: AppTextStyles.style18w400(context)
                                        ),
                                      ),
                                      Icon(
                                        dataicon[index]['Icon'],
                                        size:
                                            MediaQuery.of(context).size.width <
                                                600
                                            ? MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  30
                                            : MediaQuery.of(
                                                    context,
                                                  ).size.width <
                                                  1200
                                            ? MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  45
                                            : MediaQuery.of(
                                                    context,
                                                  ).size.width /
                                                  65,
                                        // 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(height: 100, child: Logout()),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget buildPage(int index) {
    switch (index) {
      case 0:
        return Homepage();
      case 1:
        return EmployeePage();
      case 2:
        return Projectpage();
      case 3:
        return Bannerpage();
      default:
        return Homepage();
    }
  }
}
