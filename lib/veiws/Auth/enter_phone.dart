import 'package:dashboard/veiws/Auth/forgetappbar.dart';
import 'package:dashboard/veiws/Auth/enter_phone_data.dart';
import 'package:flutter/material.dart';

class Forgetscreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Forgetscreen();
  }
}

class _Forgetscreen extends State<Forgetscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
          // width: double.infinity,
          child: Stack(
            children: [
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  width: MediaQuery.of(context).size.width * 0.98,
                  height: MediaQuery.of(context).size.height * 0.95,
                ),
              ),
              Positioned(
                top: 0.1,
                left: MediaQuery.of(context).size.width/99, //0.2,
                right: 40,
                child: Container(
                  width: double.infinity,
                  height: 143,
                  child: Forgetappbar(),
                ),
              ),
              Container(
                child: Forgetdata()
              )
            ],
          ),
        )
    );
  }
}
