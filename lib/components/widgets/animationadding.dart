import 'package:dashboard/povider/prov.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditSuccessDialog {

  void showEditSuccessDialog(
    BuildContext context,
    {required dynamic title, required VoidCallback onpressed}
  )
  {
    showDialog(
      context: context,
      builder: (dialogcontext) {
       final prov = Provider.of<Signinprovider>(dialogcontext, listen: false);
        return AlertDialog(
          title: prov.check? Icon(Icons.check_circle_outline_rounded, color: Colors.green, size: 50,)
          :Icon(Icons.cancel_outlined, color: Colors.red, size: 50,),

          content: Text(
  title is List ? title.join('\n') : title.toString(),
            style: TextStyle(
              fontSize: 14
            ),
            textAlign: TextAlign.center,
          ),

          actions: [
            TextButton(
              onPressed: onpressed,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'تم',
              style: TextStyle(
                fontSize: 14
              ),
            ),
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}