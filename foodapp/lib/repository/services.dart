

import 'package:foodapp/constants/MyConstants.dart';
import 'package:foodapp/model/State_Info.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class StateInfoRepository{

  Future<List<State_Info>> initialRequest() async{


    final response = await http.get(Uri.parse(MyConstants.HOST_URL));
    // print(response);


    if(response.statusCode==200){
      var jsonData = convert.jsonDecode(response.body) as List<dynamic>;
      // print(jsonData);


      final listResult = jsonData.map((e) => State_Info.fromJson(e)).toList();
      return listResult;

      // jsonData.forEach((element) {
      //   var model = State_Info.fromJson(element);
      //   print(model.state);
      //   setState(() {
      //     stateList = jsonData;
      //     isLoading = false;
      //     // stateList.add(stateCard(model.state, model.name));
      //   });
      }else {
      throw Exception('Error fetching pictures');
    }
    }
  }

