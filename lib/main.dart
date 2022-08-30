import 'package:flutter/material.dart';
import 'package:freelance/basic_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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

}
