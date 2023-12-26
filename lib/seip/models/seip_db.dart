import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart';
// import 'package:pencilbox_apk/models/ResponseModel.dart';
// import '../../models/seip_register_model.dart';
import 'seip_register_model.dart';

class SeipAPI{

  static String? errors;
  static String? success;

  static Future<bool> checkUniqueEmail(String email) async {
    print(email);
    bool serverResponse=false;

    try{
      Response response=await post(
          Uri.parse('https://pencilbox.edu.bd/api/seip_student_email_check'),
          body: {
            'email_address_uniq':email,
          }
      );
      if(response.statusCode==200){

        var data=jsonDecode(response.body.toString());

        if(data['success']==""){
          serverResponse=true;
        }
        else if(data['errors']=="The email address uniq has already taken."){
          serverResponse=false;

        }
        // print('Sucess...........');
      }
      else {
        print('Failed........');
        print(response.statusCode);

      }
    }catch(e){
      print(e.toString());
    }
    return serverResponse;
  }


  static Future<bool> checkUniquePhoneNo(String phone) async {
    print(phone);
    bool serverResponse=false;
    try{
      Response response=await post(
          Uri.parse('https://pencilbox.edu.bd/api/seip_student_phone_check'),
          body: {
            'phone':phone,
          }
      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());

        if(data['success']==""){
          serverResponse=true;
        }
        else if(data['errors']=="The phone number has been taken."){
          serverResponse=false;
        }
        // print('Sucess...........');
      }
      else {
        print('Failed........');
        print(response.statusCode);

      }
    }catch(e){
      print(e.toString());
    }
    return serverResponse;
  }


  static Future<bool> checkUniqueNid(String nid) async {
    print(nid);
    bool serverResponse=false;

    try{
      Response response=await post(
          Uri.parse('https://pencilbox.edu.bd/api/seip_student_national_id_check'),
          body: {
            'national_id':nid,
          }
      );
      if(response.statusCode==200){

        var data=jsonDecode(response.body.toString());

        if(data['success']==""){
          serverResponse=true;
        }
        else if(data['errors']=="This Nid number has been taken."){
          serverResponse=false;

        }
        // print('Sucess...........');
      }
      else {
        print('Failed........');
        print(response.statusCode);

      }
    }catch(e){
      print(e.toString());
    }
    return serverResponse;
  }

  static Future<Map<String,dynamic>> seip_student_registration(SeipRegistrationModel seipRegistrationModel) async {

    var data;
    try{
      print(seipRegistrationModel.toString());
      EasyLoading.show();
      Response response=await post(
          Uri.parse('https://pencilbox.edu.bd/api/seip-student-store'),
          body: seipRegistrationModel.toMap()
      );
      print('response ${response.statusCode}');
      if(response.statusCode==200){
        EasyLoading.dismiss();
        print('SUCCESS.......................');
        data =jsonDecode(response.body.toString());
        print('MAP ${data.toString()}');

        // print(data['success'].toString());
        // print(data['errors'].toString());

        //print(ResponseModel.fromJson(data));
        // errors= data['errors'].toString();
        // success= data['success'].toString();

        // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        //   content: Text('Registration succesful for '+seipRegistrationModel.full_name! + 'Thank you'),
        // ));
      }
      else {
        print('Failed........');
        EasyLoading.dismiss();
      }
    }catch(e){
      print(e.toString());
      EasyLoading.dismiss();
    }

    return data;

  }
}