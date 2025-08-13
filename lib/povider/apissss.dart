// povider/apissss.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Apissss
{
  Future postapi ( url , Object body) async
  {
    Uri urlfinsh = Uri.parse(url);
    var responsebody = null;
    var response = await http.post(
      urlfinsh,
      body: body
    );
    responsebody = jsonDecode(response.body);
    return responsebody;
  }

Future postapi2 ( url , Object body, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.post(
      urlfinsh,
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);

    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }
    return responsebody;
  }

  Future postapiimage ( url , Object body, XFile? imagefile ,String token) async
  {
    Uint8List bytes = await imagefile!.readAsBytes();
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    var request = http.MultipartRequest('POST', urlfinsh);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add( await http.MultipartFile.fromBytes('image', bytes, filename: imagefile.name ));
    (body as Map).forEach((key, value) {
    request.fields[key] = value;
  });
    var response = await request.send().timeout(Duration(seconds: 15));

    if(response.statusCode == 200)
    {
      var responseb = await http.Response.fromStream(response);
      responsebody = await jsonDecode(responseb.body);
      return responsebody;
    }else{
      return {
      "status": false,
      "message": "Something went wrong",
      "code": response.statusCode,
      "response": responsebody
    };
    }
  }

  Future getapi2 ( url, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.get(
      urlfinsh,
      headers: {
        'Accept': 'application/json',
        'Authorization' : 'Bearer $token'
      },
    );
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);

    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }else{
      responsebody = {
      "status": false,
      "message": "Error: ${response.statusCode}"
    };
    }
    return responsebody;
  }

  Future postaplist ( url , Object body, List<String> features,XFile? imagefile ,String token) async
  {
    Uint8List bytes = await imagefile!.readAsBytes();
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    var request = http.MultipartRequest('POST', urlfinsh);
    request.headers['Authorization'] = 'Bearer $token';
    request.files.add( await http.MultipartFile.fromBytes('image', bytes, filename: imagefile.name ));
    (body as Map).forEach((key, value) {
    request.fields[key] = value;
  });
  for (var f in features) {
    request.fields['feature[]'] = f;
  }
    var response = await request.send().timeout(Duration(seconds: 15));

    if(response.statusCode == 200)
    {
      var responseb = await http.Response.fromStream(response);
      responsebody = await jsonDecode(responseb.body);
      return responsebody;
    }else{
      return {
      "status": false,
      "message": "Something went wrong",
      "code": response.statusCode,
      "response": responsebody
    };
    }
  }

  Future deleteApi ( url , Object body, String token) async
  {
    final urlfinsh = Uri.parse(url);
    var responsebody = null;
    final response = await http.delete(
      urlfinsh,
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : 'Bearer $token'
      },
      body: jsonEncode(body),
    );
    responsebody = jsonDecode(response.body);
    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);

    } else if(response.statusCode == 504){
      responsebody = {
        "status" : false,
        "message" : "sirver not connect"
      };
    }
    return responsebody;
  }

  Future deleteApiList(
  String url,
  Object body,
  List<String> features,
  String token,
) async {
  final urlfinsh = Uri.parse(url);
  var responsebody;

  final Map<String, dynamic> bodyMap = Map<String, dynamic>.from(body as Map);


  for (var f in features) {
    bodyMap.putIfAbsent('feature[]', () => f);
  }


  try {
    final response = await http.delete(
      urlfinsh,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer $token',
      },
      body: bodyMap.map((key, value) => MapEntry(key, value.toString())),
    );

    if (response.statusCode == 200) {
      responsebody = jsonDecode(response.body);
    } else {
      responsebody = {
        "status": false,
        "message": "Something went wrong",
        "code": response.statusCode,
      };
    }
  } catch (e) {
    responsebody = {
      "status": false,
      "message": e.toString(),
    };
  }

  return responsebody;
}

}