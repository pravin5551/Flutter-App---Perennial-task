import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:foodapp/constants/MyConstants.dart';
import 'package:foodapp/model/State_Info.dart';
import 'package:foodapp/view_model.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';

class HomeTab extends StatefulWidget {

  @override
  _HomeTabState createState() => _HomeTabState();


}

class _HomeTabState extends State<HomeTab> {

  // List stateList = [];
  // bool isLoading = false;

  // Future<State_Info> initialRequest() async{
  //
  //   var url = Uri.parse(MyConstants.HOST_URL);
  //   http.Response response = await http.get(url);
  //
  //   if(response.statusCode==200){
  //     var jsonData = convert.jsonDecode(response.body) as List<dynamic>;
  //
  //     stateList.clear();
  //
  //     jsonData.forEach((element) {
  //       var model = State_Info.fromJson(element);
  //       print(model.state);
  //       setState(() {
  //         stateList = jsonData;
  //         isLoading = false;
  //         stateList.add(stateCard(model.state, model.name));
  //       });
  //     });
  //   }else {
  //     stateList = [];
  //     isLoading = false;
  //   }
  // }

  Widget stateCard(var stateCode, var stateName){
    print('Showing state $stateName');

    return Expanded(child: Row(
      children: [
        Expanded(child:Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          child: Text('$stateCode | $stateName',
          style: TextStyle(
            fontSize: 20
          ),),
        ))
      ],

    ));
  }


  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     stateList.clear();
  //     initialRequest();
  //   });
  //
  //   stateList.add(stateCard("Loading", "Please Wait"));
  // }
  ListOfSates_Viewmodel listOfSates_Viewmodel = new ListOfSates_Viewmodel();

  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                future: listOfSates_Viewmodel.fetchSatetname(),
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else{
                    return ListView.builder(
                      itemCount: listOfSates_Viewmodel.state_name.length,
                      itemBuilder: (context, index) {
                        return  ListTile(
                            tileColor: Colors.redAccent[100],
                            title: Center(
                              child: Text('${listOfSates_Viewmodel.state_name[index].state_info_response.name}', style: TextStyle(color: Colors.redAccent, fontSize: 25, fontFamily: defaultFontFamily),),

                            ),
                          );

                      },
                    );
                  }
                },
              )
            ),
          ],
        ),
      ),
    );
  }

//Text('${listOfSates_Viewmodel.state_name[index].state_info_response.name}', style: TextStyle(color: Colors.redAccent, fontSize: 25, fontFamily: defaultFontFamily),),

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.redAccent,
  //     body: Container(
  //       width: double.infinity,
  //       height: double.infinity,
  //       margin: EdgeInsets.all(5),
  //       padding: EdgeInsets.all(2),
  //       child: ListView(
  //         children: stateList,
  //       ),
  //     ),
  //   );
  // }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: SafeArea(
  //       child: Column(
  //         children: [
  //           Expanded(
  //             child: ListView.builder(
  //               itemCount: stateList.length,
  //               itemBuilder: (context, index) {
  //                 return Padding(
  //                   padding: const EdgeInsets.all(5.0),
  //                   child: ListTile(
  //                     tileColor: Colors.redAccent[100],
  //                     title: Center(
  //                       child: Text(
  //                         stateList[index]['name'].toString(),
  //                         style: TextStyle(fontSize: 15.0),
  //                       ),
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }


}
