// veiws/homepage/homepage.dart
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/homepage/Employees.dart';
import 'package:dashboard/veiws/homepage/announcement.dart';
import 'package:dashboard/veiws/homepage/projects.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Homepage();
  }
}

class _Homepage extends State<Homepage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<Signinprovider>(context, listen: false).GetBanner();
      Provider.of<Signinprovider>(context, listen: false).Employees();
      Provider.of<Signinprovider>(context, listen: false).Projects();
      Provider.of<Signinprovider>(context, listen: false).profile();
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(
            MediaQuery.of(context).size.width < 600
                ? MediaQuery.of(context).size.height / 99
                : MediaQuery.of(context).size.width < 1200
                ? MediaQuery.of(context).size.height / 95
                : MediaQuery.of(context).size.height / 99.9,
          ),
          child: HomeType(context),
        ),
      ),
    );
  }
}

Widget HomeType(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  if (width < 600) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 10),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height /2.35,
              maxWidth:  MediaQuery.of(context).size.width / 1.5,
            ),
            child: AspectRatio(
              aspectRatio: 476/263,
              child: Announcement()),
          ),
        ),
        Container(
              width: MediaQuery.of(context).size.width / 1.5,
              // height: 510,
              height: MediaQuery.sizeOf(context).height/2,
              child: Employees(),
            ),
            Container(
                width: MediaQuery.of(context).size.width / 1.5,
              // height: 800,
              height: MediaQuery.sizeOf(context).height/1.1,
              child: Projects(),
            ),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width / 3.4
                  : MediaQuery.of(context).size.width / 3.5,
              margin: EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.width < 900
                  ? MediaQuery.sizeOf(context).height/3
                  : 
              340,
              child: Announcement(),
            ),
            Container(
                width: MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width / 3
                  : MediaQuery.of(context).size.width / 4,
              margin: EdgeInsets.only(bottom: 10),
              // height: 510,
              height: MediaQuery.sizeOf(context).height/2,
              child: Employees(),
            ),
          ],
        ),
        Container(
                width: MediaQuery.of(context).size.width < 1200
              ? MediaQuery.of(context).size.width / 2.5
              : MediaQuery.of(context).size.width / 2,
              // height: 800,
              height: MediaQuery.sizeOf(context).height/1.1,
            
              child: Projects(),
            ),
      ],
    );
  }
}
