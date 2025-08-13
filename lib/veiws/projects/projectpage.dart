// veiws/projects/projectpage.dart
import 'dart:io';

import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/employee/addingbutton.dart';
import 'package:dashboard/veiws/projects/editproject.dart';
import 'package:dashboard/veiws/projects/projectdata.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Projectpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Projectpage();
  }
}

class _Projectpage extends State<Projectpage> {
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
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Container(
                    width:  MediaQuery.of(context).size.width<600?
                                MediaQuery.of(context).size.width/1.6:
                                MediaQuery.of(context).size.width<1200?
                                MediaQuery.of(context).size.width/1.5:
                                MediaQuery.of(context).size.width/1.4,
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Projectdata(),
                        Container(
                          width: MediaQuery.of(context).size.width < 600
                                      ? MediaQuery.of(context).size.width / 4
                                      : MediaQuery.of(context).size.width < 900
                                      ? MediaQuery.of(context).size.width / 5
                                      : MediaQuery.of(context).size.width / 6,
                                  height: MediaQuery.of(context).size.width < 600
                                      ? 40
                                      : MediaQuery.of(context).size.width < 1200
                                      ? 50
                                      : 50,
                          child: Addingbutton(
                            textbotton: "اضافة مشروع",
                            onPressed: () async {

                              File imageFromAssets = File('assets/images/Mobile.png');
                              Editproject(botton: "اضافة مشروع", context: context, namee: '', prjdescription: '', advatagess: '', index: 21, image: imageFromAssets);//thir is index
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
