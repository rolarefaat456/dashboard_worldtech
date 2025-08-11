import 'package:dashboard/components/core/utils/app_colors.dart';
import 'package:dashboard/components/core/utils/app_text_style.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Addingbutton extends StatefulWidget {
  final String textbotton;
  final VoidCallback onPressed;
  const Addingbutton({
    super.key,
    required this.textbotton,
    required this.onPressed,
  });

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Addingbutton();
  }
}

class _Addingbutton extends State<Addingbutton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Consumer<Signinprovider>(
          builder: (context, value, child) {
            return Container(
              width: MediaQuery.of(context).size.width < 600
                  ? MediaQuery.of(context).size.width / 20
                  : MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width / 15
                  : MediaQuery.of(context).size.width / 30,
              height: 70,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 51, 51, 51),
                borderRadius: BorderRadius.circular(35),
              ),
              child: MaterialButton(
                onPressed: widget.onPressed,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      widget.textbotton,
                      style: AppTextStyles.style18w400(context).copyWith(color: AppColors.White)
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: AppColors.Violet_Blue,
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
