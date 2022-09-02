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
  List<Data>datalist =[];
  List<Data>childlist=[];

  @override
  void initState() {
//  apiparent();
  RemoteService.getparentlist().then((value) {
    setState(() {
      datalist.addAll(value!);
    });
  });
  // setState(() {
  //
  //   // FirstModel aa = FirstModel();
  //   // datalist= aa.data!;
  //  // datalist= RemoteService.getTodaylist() as List<Data>;
  // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(


      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: ListView.builder(
            itemCount: datalist.length,
            itemBuilder: (context, index) {
              return ExpansionTile(
                trailing: const SizedBox.shrink(),
                leading: const Icon(Icons.add),
                title: Text(datalist[index].agentId.toString()+"     "+datalist[index].userName.toString()+"     "+datalist[index].balance.toString()+" "
                    "    "+datalist[index].equity.toString(),style: TextStyle(color: Colors.red,fontSize: 16),),
                onExpansionChanged: (bool open) async {
                  if(open){
                    RemoteService.getchildlist().then((value) {
                      setState(() {
                        childlist.addAll(value!);
                      });
                    });


                  }
                },
                children: [
                 FutureBuilder<List<Data>?>(
                   future: RemoteService.getchildlist(),
                   builder: (context, snapshot) {

                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child:  CircularProgressIndicator(),);
                    }
                     else {
                     return  ListView.builder(
                         shrinkWrap: true,
                         physics: NeverScrollableScrollPhysics(),
                         scrollDirection: Axis.vertical,
                         itemCount: snapshot.data!.length,
                         itemBuilder: (context, index) {

                          return Text(snapshot.data![index].userName.toString());
                         });

                     //  return Container(
                     //    padding: EdgeInsets.only(left: 30),
                     //  color: Colors.yellow,
                     //  width: double.infinity,
                     //   height: 50,
                     //   child: Center(child: Text(snapshot.data![index].agentId.toString()))
                     // );
                    }

                   }),

                 // snapshot.data![index].agentId.toString(),

              ]


              //     child: ListView.builder(
              // itemCount: snapshot.data?.length,
              //     itemBuilder: (context, index) {
              //       return Text(snapshot.data![index].agentId.toString());
              //     }),
              // Text(childlist[0].userName.toString(),style: TextStyle(color: Colors.black54,fontSize: 20),)
                  // ListView.builder(
                  //     itemCount: childlist.length,
                  //     itemBuilder: (context, index) {
                  //       return Text(childlist[index].userName.toString(),style: TextStyle(color: Colors.black54,fontSize: 20),);
                  //     })

                // child: Row(
                //
                //   children: [
                //     Text(datalist[index].agentId.toString(),style: TextStyle(color: Colors.red,fontSize: 16),),
                //     SizedBox(width: 20),
                //     Text(datalist[index].userName.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                //     SizedBox(width: 20),
                //     Text(datalist[index].agentId.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                //     SizedBox(width: 20),
                //     Text(datalist[index].agentId.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                //   ],
                // ),
              );
            }),
        ),
      ),
    );





  }

 // Widget buildTile(BasicTile e,{double leftPadding =16}) {
 //    if(e.tiles.isEmpty){
 //      return ListTile(
 //        contentPadding: EdgeInsets.only(left: leftPadding+50),
 //        title: Text(e.title!),
 //
 //      );
 //    }else {
 //      return ExpansionTile(title: Text(e.title!),
 //        trailing: const SizedBox.shrink(),
 //        leading: const Icon(Icons.add),
 //        tilePadding: EdgeInsets.only(left: leftPadding),
 //        children: e.tiles.map((e)=>buildTile(e,leftPadding: 16+leftPadding)).toList(),
 //
 //
 //      );
 //    }
 //    }
  Future <FirstModel?> apiparent() async {
    var _URL = "https://testapi.cptinternational.com/api/Agents/SearchAgentTree";
    Uri uri = Uri.parse(_URL);
    var token="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjNkMzA2ZjlmLTdmMjQtNDIzOC1iN2NmLWVmOGJkYjFhMzIwNyIsImh0dHA6Ly9zY2hlbWFzLm1pY3Jvc29mdC5jb20vd3MvMjAwOC8wNi9pZGVudGl0eS9jbGFpbXMvcm9sZSI6IkMiLCJleHAiOjE2NjIxODUyODcsImlzcyI6IlVzZXJDZW50ZXIiLCJhdWQiOiJhbGwifQ.JnhfMUMHVte7NhT60-it9yJ40dG5LySO9JXaYDztjZQ";
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

    if(response.statusCode==200){




      return FirstModel.fromJson(json.decode(response.body));
      // return FirstModel(statusCode: aa['statusCode'],message: aa['message'],data: aa['data']);
        // return fm.data;



    }
  }

}
