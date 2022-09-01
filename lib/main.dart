import 'dart:convert';
import 'package:freelance/firstModel/firstModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:freelance/RemoteService.dart';
import 'package:freelance/basic_tile.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  List<Data>datalist =[];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {



  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    apiparent();
   // RemoteService.getparent();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


      ),
      body: ListView(
        children:  basicTiles.map(buildTile).toList(),


      ),

    );
  }

 Widget buildTile(BasicTile e,{double leftPadding =16}) {
    if(e.tiles.isEmpty){
      return ListTile(
        contentPadding: EdgeInsets.only(left: leftPadding+50),
        title: Text(e.title!),

      );
    }else {
      return ExpansionTile(title: Text(e.title!),
        trailing: const SizedBox.shrink(),
        leading: const Icon(Icons.add),
        tilePadding: EdgeInsets.only(left: leftPadding),
        children: e.tiles.map((e)=>buildTile(e,leftPadding: 16+leftPadding)).toList(),


      );
    }
    }
  Future apiparent() async {
    var _URL = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
    Uri uri = Uri.parse(_URL);
var token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjU4M2YxZTMxLTI3ZDEtNDI0NS1iNjNiLTE3NzA4Nzc1YzgzMiIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkEiLCJleHAiOjE2NjIxMDE1MDMsImlzcyI6IlVzZXJDZW50ZXIiLCJhdWQiOiJhbGwifQ.QADFEE6N3tPAoSfy2Jr8Fgtj2HgzORxeHVViLyDT5wA";
    var response = await http.post(uri,headers: <String,String>{
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
    },
      body: jsonEncode(<String,dynamic>{
      "account": "603273",
      "businessType": "FT_A",
      "keyword": "603273",
      "search": "Y"
    }),
    );
    var data = jsonDecode(response.body);
    if(response.statusCode==200){
      setState(() {
        datalist=data
      });
      print("hello hemant");
      var hemant=data['message'];

    }
  }

}
