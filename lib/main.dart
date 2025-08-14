// main.dart
import 'dart:io';
import 'package:dashboard/veiws/banner/bannerpage.dart';
import 'package:dashboard/veiws/employee/employeepage.dart';
import 'package:dashboard/veiws/homepage/homepage.dart';
import 'package:dashboard/veiws/mainpage/mainpage.dart';
import 'package:dashboard/povider/prov.dart';
import 'package:dashboard/veiws/projects/projectpage.dart';
import 'package:dashboard/veiws/Auth/enter_pass.dart';
import 'package:dashboard/veiws/Auth/enter_pin_code.dart';
import 'package:dashboard/veiws/Auth/enter_phone.dart';
import 'package:dashboard/veiws/Auth/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(
    dir.path
  );
  await Hive.openBox('language');
  await Hive.openBox('token');
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    await windowManager.ensureInitialized();

    WindowOptions options = const WindowOptions(
      // size: Size(800, 600),
      center: true,
      // backgroundColor: Colors.transparent,
      // titleBarStyle: TitleBarStyle.normal,
    );

    windowManager.waitUntilReadyToShow(options, () async {
      await windowManager.show();
      // await windowManager.setResizable(false);
      // await windowManager.setMinimizable(false);
      await windowManager.setMinimumSize(const Size(850, 700));
      // await windowManager.setMaximizable(false); 
    });
  }
  runApp( ChangeNotifierProvider(
    create: (context) => Signinprovider(),
    // child: DevicePreview(
    // enabled: true,
    // builder: (context) => 
    child:  MyApp()
  // ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signin(),
      routes: {
        'MainPage' : (context) => Mainpage(),
        'Signin' : (context) => Signin(),
        'HomePage' : (context) => Homepage(),
        'Employee' : (context) => EmployeePage(),
        'Forgetscreen' : (context) => Forgetscreen(),
        'ForgetPageTwo' : (context) => Forgetpagetwo(),
        'ForgetPageThree' : (context) => Forgetpagethree(),
        'Projectpage' : (context) => Projectpage(),
        'Bannerpage' : (context) => Bannerpage(),
      },
    );
  }
}
