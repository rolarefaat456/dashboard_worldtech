import 'package:dashboard/veiws/banner/addbanner.dart';
import 'package:dashboard/veiws/banner/bannerdata.dart';
import 'package:dashboard/veiws/employee/addingbutton.dart';
import 'package:flutter/material.dart';

class Bannerpage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Bannerpage();
  }
}

class _Bannerpage extends State<Bannerpage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width < 600
                          ? MediaQuery.of(context).size.width / 1.6
                          : MediaQuery.of(context).size.width < 1200
                          ? MediaQuery.of(context).size.width / 1.5
                          : MediaQuery.of(context).size.width / 1.4,
                      height: 600,
                      child: Bannerdata(),
                    ),
                    Container(width: 1, color: Colors.black38),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width < 600
                      ? MediaQuery.of(context).size.width / 4
                      : MediaQuery.of(context).size.width < 900
                      ? MediaQuery.of(context).size.width / 5
                      : MediaQuery.of(context).size.width / 6,
                  // //200,
                  height: MediaQuery.of(context).size.width < 600
                      ? 40
                      : MediaQuery.of(context).size.width < 1200
                      ? 50
                      : 50,
                  child:  Addingbutton(
                        textbotton: 'إضافة إعلان',
                        onPressed: () async {
                          
                          Addbanner(
                            botton: 'إضافة إعلان',
                            context: context,
                            
                          );
                        },
                      )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
