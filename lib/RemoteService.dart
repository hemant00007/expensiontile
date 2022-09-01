import 'dart:async';


import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:freelance/firstModel/firstModel.dart';
class RemoteService {

 static var token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjU4M2YxZTMxLTI3ZDEtNDI0NS1iNjNiLTE3NzA4Nzc1YzgzMiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkEiLCJleHAiOjE2NjIxMDE1MDMsImlzcyI6IlVzZXJDZW50ZXIiLCJhdWQiOiJhbGwifQ.QADFEE6N3tPAoSfy2Jr8Fgtj2HgzORxeHVViLyDT5wA";
  static var client = dio.Dio();
  static Future<FirstModel?> getparent() async{
    String theUrl = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
    var formData = FormData.fromMap({
           "account": "603273",
          "businessType": "FT_A",
          "keyword": "603273",
          "search": "Y"
    });
    try {
      dio.Response response = await client
          .post(theUrl,
          options:
          dio.Options(
              headers: {
                // 'Authorization': 'Bearer$token'
                'Content-Type': 'application/json',
                'Accept': 'application/json',
                'Authorization': 'Bearer $token',
              }
              ),data: formData)
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        print("Success hemant");
        //     return PhoneNo(status: data['status'],message: data['message']);
        return FirstModel.fromJson(response.data);
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      return null;
    }
  }
}