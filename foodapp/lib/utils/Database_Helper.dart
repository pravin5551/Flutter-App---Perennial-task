import 'dart:async';
import 'dart:io';
import 'package:foodapp/model/User.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static Database _db;
  static DatabaseHelper _databaseHelper;    // Singleton DatabaseHelper

  final String userTable = 'userTable';
  final String columnId = 'id';
  final String columnUserName = 'username';
  final String columnPassword = 'password';


  DatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory DatabaseHelper() {

    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get db async{
    if(_db != null){
      return _db;
    }
    _db = await intDB();
    return _db;
  }


  Future<Database> intDB() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    print('db location : ' + documentDirectory.path);
    String path = join(documentDirectory.path , 'mydb.db');
    var myOwnDB = await openDatabase(path,version: 1,
        onCreate: _onCreate);
    return myOwnDB;
  }

  void _onCreate(Database db , int newVersion) async{
    var sql = "CREATE TABLE $userTable ($columnId INTEGER PRIMARY KEY,"
        " $columnUserName TEXT, $columnPassword TEXT)";
    await db.execute(sql);
  }

  Future<int> saveUser( User user) async{
    var dbClient = await  db;
    int result = await dbClient.insert("$userTable", user.toMap());
    return result;
  }


  Future<List> getAllUsers() async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $userTable";
    List result = await dbClient.rawQuery(sql);
    return result.toList();
  }

  Future<int> getCount() async{
    var dbClient = await  db;
    var sql = "SELECT COUNT(*) FROM $userTable";

    return  Sqflite.firstIntValue(await dbClient.rawQuery(sql)) ;
  }

  Future<User> getUser(int id) async{
    var dbClient = await  db;
    var sql = "SELECT * FROM $userTable WHERE $columnId = $id";
    var result = await dbClient.rawQuery(sql);
    if(result.length == 0) return null;
    return  new User.fromMap(result.first) ;
  }


  Future<int> deleteUser(int id) async{
    var dbClient = await  db;
    return  await dbClient.delete(
        userTable , where: "$columnId = ?" , whereArgs: [id]
    );
  }

  Future<int> updateUser(User user) async{
    var dbClient = await  db;
    return  await dbClient.update(
        userTable ,user.toMap(), where: "$columnId = ?" , whereArgs: [user.id]
    );
  }


  // Future<int> close() async{
  //   var dbClient = await  db;
  //   return  await dbClient.close();
  // }


}