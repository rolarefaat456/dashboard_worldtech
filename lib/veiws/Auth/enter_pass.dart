// veiws/Auth/enter_pass.dart
import 'package:dashboard/veiws/Auth/enterpass_data.dart';
import 'package:dashboard/components/widgets/forgetappbar.dart';
import 'package:flutter/material.dart';

class Forgetpagethree extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Forgetpagethree();
  }
}

class _Forgetpagethree extends State<Forgetpagethree> {
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
                  child: Enterpass()
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
