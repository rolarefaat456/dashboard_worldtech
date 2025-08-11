import 'dart:io';

import 'package:dashboard/povider/apissss.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class Signinprovider extends ChangeNotifier {
  String baseurl =
      "https://lightcoral-giraffe-475787.hostingersite.com/WorldTech/public";
  IconData iconData = Icons.visibility_off_outlined;
  bool obscure = true;
  bool obscure1 = true;
  bool obscure2 = true;
  IconData iconData1 = Icons.visibility_off_outlined;
  IconData iconData2 = Icons.visibility_off_outlined;
   TextEditingController email = new TextEditingController();
   TextEditingController password = new TextEditingController();
   TextEditingController username = new TextEditingController();
   TextEditingController employeejob = new TextEditingController();
  late Box tokenbox = Hive.box("token");

  // provider page two
  int counter = 0;
  int index = 0;

  // edit admen==in profile
  bool readonly = true;
  bool enabled = false;
  String botton = "تعديل بيانات الحساب";

  void ifedit() {
    if (readonly == true) {
      enabled = true;
      readonly = false;
      botton = "حفظ التعديلات";
    } else {
      enabled = false;
      readonly = true;
      botton = "تعديل بيانات الحساب";
    }
    notifyListeners();
  }

  // edit project
  bool readonlypro = true;
  bool enabledpro = false;
  String bottonpro = "تعديل البيانات";

  void ifeditpro() {
    if (readonly == true) {
      enabled = true;
      readonly = false;
      botton = "حفظ التعديلات";
      notifyListeners();
    } else {
      enabled = false;
      readonly = true;
      botton = "تعديل البيانات";
    }
    notifyListeners();
  }

  // List <Emplyeedataclass> _dataemployee = [];
  String? prjdecoration;
  String? name;
  String? image;
  String? advatages;

  // List <Emplyeedataclass> _dataemployee = [];
  String? phoneem;
  String? namepro;
  String? imagepro;
  String? job;

  // adding image
  XFile? _image;
  set setImage(XFile? file) {
  _image = file;
  notifyListeners();
}
XFile? get getImage => _image;

Future<void> pickImageFromGallery() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(source: ImageSource.gallery);

  if (pickedFile != null) {
    _image = pickedFile;
    notifyListeners();
  } else {
    print('No image selected.');
  }
}

  // animationadding
  int selectindexbotton = 0;

  void selectingbotton(int index) {
    selectindex = index;
    notifyListeners();
  }

  String titlename() {
    if (selectindex == 0) {
      return 'الصفحة الرئيسية';
    } else if (selectindex == 1) {
      return 'الموظفين';
    } else if (selectindex == 2) {
      return 'المشاريع';
    } else {
      return 'الإعلانات';
    }
  }

  // menu
  Color color = Colors.white;
  int selectindex = 0;

  void selecting(int index) {
    selectindex = index;
    notifyListeners();
  }

  void colorr(int selected) {
    if (color == Colors.white) {
      color = Color.fromARGB(255, 242, 241, 237);
    } else {
      color = Colors.white;
    }
    notifyListeners();
  }

  int get currentindex {
    return selectindex;
  }

  void isemptyy() {
    if (counter == 1) {
      index++;
    }
    notifyListeners();
  }

  void isvisibliyoff() {
    if (iconData == Icons.visibility_off_outlined) {
      iconData = Icons.visibility_outlined;
      obscure = false;
    } else {
      iconData = Icons.visibility_off_outlined;
      obscure = true;
    }
    notifyListeners();
  }

  void isvisibliyoff1() {
    if (iconData1 == Icons.visibility_off_outlined) {
      iconData1 = Icons.visibility_outlined;
      obscure1 = false;
    } else {
      iconData1 = Icons.visibility_off_outlined;
      obscure1 = true;
    }
    notifyListeners();
  }

  void isvisibliyoff2() {
    if (iconData2 == Icons.visibility_off_outlined) {
      iconData2 = Icons.visibility_outlined;
      obscure2 = false;
    } else {
      iconData2 = Icons.visibility_off_outlined;
      obscure2 = true;
    }
    notifyListeners();
  }

  var check;
  var loginn;
  String token = "";
  Apissss api = Apissss();
  bool isLoading = false;

  void setLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future login() async {
    check = null;
    setLoading(true);

    Object body = {"email": email.text, "password": password.text};

    try {
      loginn = await api.postapi("$baseurl/api/login", body);
      print('loginn is $loginn');
      if (loginn != null && loginn['status'] == true) {
      tokenbox.put("token", loginn['data']['token']);
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("Error during login: $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var forget;

  Future forgetpassword() async {
    check = null;
    setLoading(true);

    Object body = {"email": email.text};
    print(email.text);

    try {
      forget = await api.postapi("$baseurl/api/forget-password", body);

      print('forget is $forget');
    } catch (e) {
      print("Error during forget password: $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    if (forget != null && forget['status'] == true) {
      check = true;
    } else {
      check = false;
    }
  }

  List <TextEditingController> opts = List.generate(
    4,
    (_) => new TextEditingController(),
  );
  var vertfyy;
  Future verify() async {
    check = null;
    setLoading(true);

    String pinCode = opts.map((c) => c.text).join();

    Object body = {'email': email.text, 'otp': pinCode};

    try {
      vertfyy = await api.postapi("$baseurl/api/verify-otp", body);
      print("vertfyy is $vertfyy");
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    if (vertfyy != null && vertfyy['status'] == true) {
      check = true;
    } else {
      check = false;
    }

    notifyListeners();
  }

  Logout() async {
    //! post w msh 3ayz body wla header
  }

  var reset;
  Future Reset() async {
    check = null;
    setLoading(true);

    Object body = {
      'email': email.text,
      'password': password.text,
      'password_confirmation': password_confirmation.text,
    };
    try {
      reset = await api.postapi("$baseurl/api/reset-password", body);
      print(reset);
      if (reset != null && reset['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    notifyListeners();
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    
  }

  var resendCode;
  Future ResendCode() async {
    check = null;
    setLoading(true);

    Object body = {'email': email.text};
    try {
      resendCode = await api.postapi("$baseurl/api/resend-code", body);
      print('resendCode is $resendCode');
    } catch (e) {
      print("Error : $e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }

    if (resendCode != null && resendCode['status'] == true) {
      check = true;
    } else {
      check = false;
    }

    notifyListeners();
  }

   TextEditingController first_name = new TextEditingController();
  // new TextEditingController imagecontrol = new TextEditingController();
  String? imageadmin;

  var profilee;

  Future profile() async {
    check = null;
    setLoading(true);

    try {
      profilee = await api.getapi2('$baseurl/api/profile', tokenbox.get("token"),);
      print('profilee is $profilee');
      print(tokenbox.get("token"),);
      if (profilee != null && profilee['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var getbanner;

  Future GetBanner() async {
    check = null;
    setLoading(true);
    try {
      getbanner = await api.getapi2('$baseurl/api/banners', tokenbox.get("token"),);
      print('getbanner is $getbanner');
      print(tokenbox.get("token"),);
      if (getbanner != null && getbanner['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  void clearPickedImage() {
  _image = null;
  notifyListeners();
}

   TextEditingController last_name = new TextEditingController();
   TextEditingController current_password = new TextEditingController();
   TextEditingController password_confirmation = new TextEditingController();

var updateProfile;

  Future UpdateProfile() async {
  check = null;
  setLoading(true);


  Object body = {
    '_method' : 'put',
    'first_name' : first_name.text,
    'last_name' : last_name.text,
    'current_password' : current_password.text,
    'email' : email.text ,
    'password' : password.text,
    'password_confirmation' : password_confirmation.text
  };

  print("body: $body");

  try {
  if ( _image != null )
  {
    updateProfile = await api.postapiimage('$baseurl/api/profile', body, _image, tokenbox.get("token"));
    print(tokenbox.get("token"));
  }
    else{
      print(username.text);
      updateProfile = await api.postapi2('$baseurl/api/profile', body, tokenbox.get("token"));
    }
    print(updateProfile);
    if (updateProfile != null && updateProfile['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
    print('updateProfile is $updateProfile');
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}


  var addbannerapi;

  Future AddBanner(BuildContext context) async {
    check = null;
    setLoading(true);

    Object body = {};


    if (_image == null) {
      setLoading(false);
      check = false;
      return;
    }

    try {
      addbannerapi = await api.postapiimage(
        '$baseurl/api/banners',
        body,
        _image,
        tokenbox.get("token"),
      );
      print(tokenbox.get("token"),);
      check = addbannerapi;
      print('addbannerapi is $addbannerapi');
      if (addbannerapi != null && addbannerapi['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
      notifyListeners();
    }
    } catch (e) {
      print(e);
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var updateBanner;
  bool isUpdatingBanner = false;

  Future UpdateBanner({required int id}) async {
    check = null;
    isUpdatingBanner = true;
    Object body = {
      '_method' : 'PUT'
    };
    if (_image == null) {
      isUpdatingBanner = false;
      check = false;
      notifyListeners();
      return;
    }
    try {
      updateBanner = await api.postapiimage(
        '$baseurl/api/banners/$id',
        body,
        _image,
        tokenbox.get("token"),
      );
      print(tokenbox.get("token"),);
      print('updateBanner $updateBanner');
      if (updateBanner != null && updateBanner['status'] == true) {
        GetBanner();
      check = true;
      notifyListeners();
    } else {
      check = false;
      notifyListeners();
    }
    } catch (e) {
      print(e);
      check = false;
      notifyListeners();
    } finally {
      isUpdatingBanner = false;
      notifyListeners();
    }
  }

  // da5d el image elly b7zfha

  Future<XFile?> downloadImageAsXFile(String imageUrl) async {
  try {
    final response = await http.get(Uri.parse(imageUrl));
    if (response.statusCode == 200) {
      final tempDir = await getTemporaryDirectory();
      final filePath = '${tempDir.path}/temp_image.jpg';
      final file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);
      return XFile(filePath);
    }
  } catch (e) {
    print('Error downloading image: $e');
  }
  return null;
}





  // deleteBanner

var deleteBanner;

  Future DeleteBanner({required int id}) async {
    print(tokenbox.get("token"));
    check = null;
    setLoading(true);

    Object body = {
    };

    try {
      deleteBanner = await api.postapi2(
        "$baseurl/api/banners/$id",
        body,
        tokenbox.get("token")
      );
      
      if (deleteBanner != null && deleteBanner['status'] == true) {
      check = true;
      await GetBanner();
      print('deleteBanner is $deleteBanner');
      notifyListeners();
    } else {
      check = false;
      notifyListeners();
    }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
    print('deleteBanner is $deleteBanner');
  }

  // get employees

  var employees;

  Future Employees() async {
    print(tokenbox.get("token"));
    check = null;
    setLoading(true);
    try {
      employees = await api.getapi2(
        "$baseurl/api/employees",
        tokenbox.get("token"),
      );
      print('employees is $employees');
      if (employees != null && employees['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

  var addEmployee;

  Future AddEmployee() async {
  check = null;
  setLoading(true);


  Object body = {
    'name' : username.text,
    'job' : employeejob.text,
    'phone' : employeephone.text ,
  };

  print("body: $body");

  try {
  if ( _image != null )
  {
    addEmployee = await api.postapiimage('$baseurl/api/employees', body, _image, tokenbox.get("token"));
  }
    else{
      print(username.text);
      addEmployee = await api.postapi2('$baseurl/api/employees', body, tokenbox.get("token"));
    }
    print('addEmployee is $addEmployee');
    if (addEmployee != null && addEmployee['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
    print(addEmployee);
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}
 
TextEditingController employeename = new TextEditingController();
   TextEditingController employeephone = new TextEditingController();
   TextEditingController employeejobb = new TextEditingController();

  void initializeControllers(int index) async {
    await Employees();
  if (employees != null && employees['data'] != null) {
    employeename.text = employees['data'][index]['name']?.toString() ?? '';
    employeephone.text = employees['data'][index]['phone']?.toString() ?? '';
    employeejobb.text = employees['data'][index]['email']?.toString() ?? '';
    notifyListeners();
  }
}

  // update Employee

  var updateEmployee;

  Future UpdateEmployee({required int id}) async {
  check = null;
  setLoading(true);


  Object body = {
    'name' : employeename.text,
    'job' : employeejobb.text,
    'phone' : employeephone.text ,
    '_method' : 'put'
  };

  print("body: $body");

  try {
  if ( _image != null )
  {
    updateEmployee = await api.postapiimage('$baseurl/api/employees/$id', body, _image, tokenbox.get("token"));
  }
    else{
      print(username.text);
      updateEmployee = await api.postapi2('$baseurl/api/employees/$id', body, tokenbox.get("token"));
    }
    print("updateEmployee $updateEmployee");
    if (updateEmployee != null && updateEmployee['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}

// delete Employee

  var deleteEmployee;

  Future DeleteEmployee({required int id}) async {
  check = null;
  setLoading(true);


  Object body = {
    'name' : employeename.text,
    'job' : employeejobb.text,
    'phone' : employeephone.text ,
    '_method' : 'put',
  };

  print("body: $body");

  try {

      print(username.text);
      deleteEmployee = await api.deleteApi('$baseurl/api/employees/$id', body, tokenbox.get("token"));

    print("deleteEmployee $deleteEmployee");
    if (deleteEmployee != null && deleteEmployee['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
    print(deleteEmployee);
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}



// get Project

  var projects;

  Future Projects() async {
    print(tokenbox.get("token"));
    check = null;
    setLoading(true);
    try {
      projects = await api.getapi2(
        "$baseurl/api/projects",
        tokenbox.get("token"),
      );
      print('projects is $projects');
      if (projects != null && projects['status'] == true) {
      check = true;
    } else {
      check = false;
    }
    } catch (e) {
      print("$e");
      check = false;
    } finally {
      setLoading(false);
      notifyListeners();
    }
  }

   TextEditingController title = new TextEditingController();
   TextEditingController description = new TextEditingController();
    List <TextEditingController> featureControllers = [];
  void addFeatureController() {
    featureControllers.add (TextEditingController());
    notifyListeners();
  }

  void removeFeatureController(int index) {
    featureControllers[index].dispose(); // مهم علشان ما يحصلش memory leak
    featureControllers.removeAt(index);
    notifyListeners();
  }

  void clearAllFeatureControllers() {
    for (var controller in featureControllers) {
      controller.dispose();
    }
    featureControllers.clear();
    notifyListeners();
  }

  List<String> get featureValues {
    return featureControllers.map((e) => e.text).toList();
  }

  // new TextEditingController feature = new TextEditingController();
  // new TextEditingController feature2 = new TextEditingController();

  var addProjects;

  Future AddProjects() async {
  check = null;
  setLoading(true);


  Object body = {
    'title' : title.text,
    'description' : description.text,
  };

  List<String> featuresList = featureValues;

  print("body: $body");

  try {
  if ( _image != null )
  {
    addProjects = await api.postaplist('$baseurl/api/projects', body, featuresList , _image, tokenbox.get("token"));
  }
    else{
      print(username.text);
      addProjects = await api.postapi2('$baseurl/api/projects', body, tokenbox.get("token"));
    }
    print('addProjects is $addProjects');
    if (addProjects != null && addProjects['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}
 
TextEditingController Projectsname = new TextEditingController();
   TextEditingController Projectsphone = new TextEditingController();
   TextEditingController Projectsjobb = new TextEditingController();


  // update project

  var updateProjects;

  Future UpdateProjects({required int id}) async {
  check = null;
  setLoading(true);


  Object body = {
    'name' : Projectsname.text,
    'job' : Projectsjobb.text,
    'phone' : Projectsphone.text ,
    '_method' : 'put'
  };

  print("body: $body");

  try {
  if ( _image != null )
  {
    updateProjects = await api.postapiimage('$baseurl/api/projects/$id', body, _image, tokenbox.get("token"));
  }
    else{
      print(username.text);
      updateProjects = await api.postapi2('$baseurl/api/projects/$id', body, tokenbox.get("token"));
    }
    print("updateProjects $updateProjects");
    if (updateProjects != null && updateProjects['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}

  var deleteProject;

  Future DeleteProject({required int id}) async {
  check = null;
  setLoading(true);


  Object body = {
    'title' : title.text,
    'description' : description.text,
    '_method' : 'put',
  };

  print("body: $body");
  check = null;
  setLoading(true);

  List<String> featuresList = featureValues;

  try {

      print(username.text);
      deleteProject = await api.deleteApiList('$baseurl/api/projects/$id', body,  featuresList,tokenbox.get("token"));

    print("deleteProject $deleteProject");
    if (deleteProject != null && deleteProject['status'] == true) {
      check = true;
      notifyListeners();
    } else {
      check = false;
    }
    print(deleteProject);
  } catch (e) {
    print(e);
    check = false;
  } finally {
    setLoading(false);
    notifyListeners();
  }
}

}
