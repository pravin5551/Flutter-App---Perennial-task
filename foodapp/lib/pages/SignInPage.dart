import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:foodapp/model/User.dart';
import 'package:foodapp/pages/HomePage.dart';
import 'package:foodapp/utils/Database_Helper.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  String text = '';
  bool shouldDisplay = false;
  User user;
  DatabaseHelper helper = DatabaseHelper();


  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String defaultFontFamily = 'Roboto-Light.ttf';
    double defaultFontSize = 14;
    double defaultIconSize = 17;
    // username.text = user.username;
    // password.text = user.password;


    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 0,
              child: InkWell(
                child: Container(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Icon(Icons.close),
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Flexible(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // Container(
                  //   width: 230,
                  //   height: 50,
                  //   alignment: Alignment.center,
                  //   child: Image.asset(
                  //     "assets/images/splash/perennial_pic.jpg",
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 15,
                  // ),
                  TextField(
                    controller: username,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.person,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize),
                      hintText: "User Name",
                    ),
                    onChanged: (value){
                      updateUsername();
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextField(
                    controller: password,
                    showCursor: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      filled: true,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      suffixIcon: Icon(
                        Icons.remove_red_eye,
                        color: Color(0xFF666666),
                        size: defaultIconSize,
                      ),
                      fillColor: Color(0xFFF2F3F5),
                      hintStyle: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                      ),
                      hintText: "Password",
                    ),
                    onChanged: (value){
                      updatePassword();
                    },
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    child: Text(
                      "Forgot your password?",
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontFamily: defaultFontFamily,
                        fontSize: defaultFontSize,
                        fontStyle: FontStyle.normal,
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: new BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Color(0xFFfbab66),
                        ),
                        BoxShadow(
                          color: Color(0xFFf7418c),
                        ),
                      ],
                      gradient: new LinearGradient(
                          colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
                          begin: const FractionalOffset(0.2, 0.2),
                          end: const FractionalOffset(1.0, 1.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child:  RaisedButton(
                      highlightColor: Colors.transparent,
                      splashColor: Color(0xFFf7418c),
                        child: Padding(
                          padding:
                          const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                          child: Text(
                            "SIGN IN",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontFamily: "WorkSansBold"),
                          ),
                        ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                      color: Colors.red,
                      textColor: Colors.blue,
                      onPressed: () {
                        setState(() {
                          _save();

                        });
                        var name_entered = username.text;


                        if(username != null && username.text == "pravinvpawar@gmail.com"
                            && password != null && password.text == "5551")
                        {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));

                          _save();
                        }else{
                          setState(() {
                            shouldDisplay = !shouldDisplay;
                          });
                        }

                      },
                    ),


                  ),
                  SizedBox(
                    height: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: shouldDisplay ? Text("Please check credentials once", style: TextStyle(color: Colors.red),) : Spacer(),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Align(
                // alignment: Alignment.bottomCenter,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontFamily: defaultFontFamily,
                          fontSize: defaultFontSize,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {

                      },
                      child: Container(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Color(0xFFf7418c),
                            fontFamily: defaultFontFamily,
                            fontSize: defaultFontSize,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void updatePassword() {
    user.password = password.text;
  }

  void updateUsername() {
    user.username = username.text;
  }

  //Save data to database
  void _save() async{
      int result ;

      if (user.id != null) {  // Case 1: Update operation
        result = await helper.updateUser(user);
      } else { // Case 2: Insert Operation
        result = await helper.saveUser(user);
        print(user.username);
        print('hello beautiful');

      }


      if (result != 0) {  // Success
        _showAlertDialog('Status', 'User data Saved Successfully');
      } else {  // Failure
        _showAlertDialog('Status', 'Problem Saving User data');
      }
  }


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }
}
