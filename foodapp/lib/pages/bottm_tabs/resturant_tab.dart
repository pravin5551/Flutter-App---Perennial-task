


import 'package:foodapp/model/resturant_pravin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecondAPI extends StatefulWidget {


  @override
  _SecondAPIState createState() => _SecondAPIState();
}

class _SecondAPIState extends State<SecondAPI> {
  Future<AllResponse> allResponse;
  List<Results> results = [];
  bool isSearching = false;
  TextEditingController controller = TextEditingController();

  /*
  this function hits the remote api
   */
  Future<AllResponse> getApi() async {
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=47.6204,-122.3491&radius=2500&type=restaurant&key=AIzaSyDxVclNSQGB5WHAYQiHK-VxYKJelZ_9mjk");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return AllResponse.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  /*
  this function hits the remote api
   */
  Future<AllResponse> getParticularApi(var value) async {
    var url = Uri.parse(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=47.6204,-122.3491&radius=2500&type=restaurant&keyword=:${value}&key=AIzaSyDxVclNSQGB5WHAYQiHK-VxYKJelZ_9mjk");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return AllResponse.fromJson(convert.jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    getApi().then((data) {
      setState(() {
        allResponse = getApi(); // setting the response into our model class
        results = data.results;
      });
    });
    super.initState();
  }

  /*
  This function hits the api after change in the TextField
   */
  void _filterCountries(value) {
    getParticularApi(value).then((data) {
      setState(() {
        allResponse = getParticularApi(value);
        results = data.results;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: !isSearching
            ? Text('All Restaurants')
            : TextField(
          controller: controller,
          key: ValueKey('edit_search'),
          onChanged: (value) {
            _filterCountries(value);
          },
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            // hintText: "Search Restaurants Here",
            // hintStyle: TextStyle(color: Colors.white),
          ),
        ),
        actions: <Widget>[
          isSearching
              ? IconButton(
            icon: Icon(Icons.cancel),
            onPressed: () {
              setState(() {
                this.isSearching = false;
                getApi();
              });
            },
          )
              : IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                this.isSearching = true;
              });
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: results.length > 0
            ? ListView.builder(
            itemCount: results.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {},
                child: Card(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage:
                          NetworkImage(results[index].icon),
                        ),
                        title: Text(results[index].name),
                        subtitle: Text(results[index].vicinity),
                        trailing: Container(
                          width: 30,
                          height: 20,
                          color: Colors.green,
                          child: Text(
                            results[index].rating.toString(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            })
            : Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
