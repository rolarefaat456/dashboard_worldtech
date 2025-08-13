// veiws/Auth/enter_pin_code.dart
import 'package:dashboard/components/widgets/forgetappbar.dart';
import 'package:dashboard/veiws/Auth/enter_pin_code_data.dart';
import 'package:flutter/material.dart';

class Forgetpagetwo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Forgetpagetwo();
  }
}

class _Forgetpagetwo extends State<Forgetpagetwo> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: Center(
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
                top: 0,
                // 0.9,
                left: 0,
                // MediaQuery.of(context).size.width/99,
                right: 0,
                // 20,
                child: Container(
                  width: double.infinity,
                  height: 143,
                  child: Forgetappbar(parentContext: context,),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 200),
                  child: Pagetwodata()
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
