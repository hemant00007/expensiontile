import 'dart:async';


import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:freelance/firstModel/firstModel.dart';
class RemoteService {

  static var client = dio.Dio();
  static var token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjZkZTM0MDZlLTZjYmYtNGFiMC04YzE5LTMyZjY3NzRkOGFkYiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkEiLCJleHAiOjE2NjIyODc3MjMsImlzcyI6IlVzZXJDZW50ZXIiLCJhdWQiOiJhbGwifQ.2KWsvhC18yNsiQHor0vyo9uc9mD5E4YoHDd9yQdIOrk";
 Dio? _dio;
 RemoteService(){
   _dio = Dio();
 }
 static Future <List<Data>?> getparentlist() async{
   String theUrl = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
   try{
     client.options.headers['content-Type'] = 'application/json';
     client.options.headers['Accept'] = 'application/json';
     client.options.headers["authorization"]='Bearer $token';

     Response response = await client.post(theUrl,data: {
       "account": "603273",
       "businessType": "FT_A",
       "keyword": "603273",
       "search": "Y"
     });
     if(response.statusCode==200){
       FirstModel todayvisitModel = FirstModel.fromJson(response.data);
       return todayvisitModel.data;
     }

   } on DioError catch(e){
     print(e);
   }
 }
  static Future <List<Data>?> getchildlist() async{
    String theUrl = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
    try{
      client.options.headers['content-Type'] = 'application/json';
      client.options.headers['Accept'] = 'application/json';
      client.options.headers["authorization"]='Bearer $token';

      Response response = await client.post(theUrl,data: {
        "account": "603273",
        "businessType": "FT_A",
        "keyword": "603273",
        "search": "N"
      });
      if(response.statusCode==200){
        FirstModel todayvisitModel = FirstModel.fromJson(response.data);
        return todayvisitModel.data;
      }

    } on DioError catch(e){
      print(e);
    }
  }
  // static Future<FirstModel?> getparent() async{
  //   String theUrl = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
  //   var formData = FormData.fromMap({
  //          "account": "603273",
  //         "businessType": "FT_A",
  //         "keyword": "603273",
  //         "search": "Y"
  //   });
  //   try {
  //     dio.Response response = await client
  //         .post(theUrl,
  //         options:
  //         dio.Options(
  //             headers: {
  //               // 'Authorization': 'Bearer$token'
  //               'Content-Type': 'application/json',
  //               'Accept': 'application/json',
  //               'Authorization': 'Bearer $token',
  //               'lang': 'en-us'
  //             }
  //             ),data: formData)
  //         .timeout(const Duration(seconds: 30));
  //
  //     if (response.statusCode == 200) {
  //       print("Success hemant");
  //       //     return PhoneNo(status: data['status'],message: data['message']);
  //       return FirstModel.fromJson(response.data);
  //     } else {
  //       return null;
  //     }
  //   } on TimeoutException catch (_) {
  //     return null;
  //   }
  // }
}