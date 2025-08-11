import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/homepage/announcement.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: Colors.black38, width: 1),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, right: 10),
                  child: detailes(text: "المشاريع", icon: Icons.devices_outlined)),
              ],
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                child: Consumer<Signinprovider>(
                  builder: (context, value, child) {
                    if (value.projects?['data'] == null || value.projects!['data'].isEmpty) {
              return Center(child: Text("لا توجد مشاريع"));
            }
                    if (value.isLoading) {
              return Center(child: CircularProgressIndicator());
            }
        
            
                    return GridView.builder(
                      itemCount: value.projects?['data'].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: MediaQuery.of(context).size.width < 600
                            ? 2
                            : MediaQuery.of(context).size.width < 1200
                            ? 2
                            : 4,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 12,
                        mainAxisExtent: 200,
                      ),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.only(top: 24),
                          width: 180,
                          height: 244,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(width: 1, color: Colors.black38),
                          ),
                          child: Column(
                            children: [
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: 32,
                                  maxHeight: 32,
                                ),
                                child: AspectRatio(
                                  aspectRatio: 1,
                                  child: Image.asset(
                                    "assets/images/6efb4f698e1be2f2512f41d6ad002d60a9fed91c.png",
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  value.projects?['data']?[index]?['title'] ?? "Team hup",
                                  style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Tajawal', color: AppColors.betweenblackandbabyblack)
                                ),
                              ),
                              ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 109
                                ),
                                child: AspectRatio(
                                  aspectRatio: 220/280,
                                  child:  Image.network('${value.baseurl}/${value.projects?['data']?[index]?['image']}', errorBuilder: (context, error, stackTrace) => Image.asset("assets/images/Mobile.png", fit: BoxFit.fill),) 
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                ),
              ),
            ),
          ],
              ),
    );
  }
}
