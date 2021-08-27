import 'package:flutter/cupertino.dart';

class User {

  String  username ;
  String  password ;
  int id;

  User(this.username ,this.password);
  User.map(dynamic obj){
    this.username = obj['username'];
    this.password = obj['password'];
    this.id = obj['id'];
  }


  String get _username => username;
  String get _password => password;
  int get _id => id;

  Map<String , dynamic> toMap(){
    var map = new Map<String , dynamic>();
    map['username'] = _username;
    map['password'] = _password;
    if(id != null){
      map['id'] = _id;
    }
    return map;
  }

  User.fromMap(Map<String , dynamic>map){
    this.username = map['username'];
    this.password = map['password'];
    this.id = map['id'];
  }

}