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
                    if(datalist[index].state=="closed"){
                      RemoteService.getchildlist().then((value) {
                        setState(() {
                          childlist.addAll(value!);
                        });
                      });
                    }
                    else {
                      print("No child found");
                    }



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

                          return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                width: double.infinity,
                                height: 50,
                                color: Colors.grey.shade200,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(snapshot.data![index].agentId.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                                    Text(snapshot.data![index].userName.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                                    Text(snapshot.data![index].balance.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                                    Text(snapshot.data![index].equity.toString(),style: TextStyle(color: Colors.red,fontSize: 16)),
                                  ],
                                )),
                          );
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



              );
            }),
        ),
      ),
    );





  }




}
