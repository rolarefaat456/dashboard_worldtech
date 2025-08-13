// veiws/projects/projectdata.dart

import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/veiws/projects/deletprjdata.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/projects/showprjdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Projectdata extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Projectdata();
  }
}

class _Projectdata extends State<Projectdata> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Signinprovider>(context, listen: false).Projects();
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<Signinprovider>(
        builder: (context, value, child) {
          return value.projects == null ? CircularProgressIndicator() : value.projects['data'] == null ||
              value.projects['data'].isEmpty ? Center(child: Text("No Projects available"))
              :GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: false,
            itemCount: value.projects['data'].length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount:MediaQuery.of(context).size.width<600?
                                  2:
                                  MediaQuery.of(context).size.width<1200?
                                  4:
                                  7,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              mainAxisExtent: 190,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(width: 0.5, color: Colors.black38),
                ),
                child: InkWell(
                  onTap: () {
                    // File imageFromAssets = File('assets/images/Mobile.png');
                    Showprjdata(
                      image: '${value.baseurl}/${value.projects['data'][index]['image']}',
                      context: context,
                      name: '${value.projects['data'][index]['title']}',
                      prjdescription: '${value.projects['data'][index]['description']}',
                      advatages: '${value.projects['data'][index]['feature'].toString()}',
                      index: index
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(onPressed: () {
                                // i--;
                                // Navigator.of(context).pop();
                                deletprjdata(context: context, index: index);
                                // value.deleteproject(index);
                              },
                              icon: Icon(Icons.delete_outline_rounded)
                            )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              value.projects['data'][index]['title'],
                              style: AppTextStyles.style16w400(context).copyWith(fontFamily: 'Almarai')
                            ),
                          ),
                          Container(
                            height: 109,
                            child: Image.network('${value.baseurl}/${value.projects['data'][index]['image']}', fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) =>
                              Image.asset("assets/images/Mobile.png", fit: BoxFit.fill)
                            ),
                          ),
                        ],
                      ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
