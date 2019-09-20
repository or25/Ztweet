import 'package:flutter/material.dart';
import 'package:restaurant_booking/widgets/restaurant.dart';
import 'package:restaurant_booking/widgets/starDisplay.dart';
import 'package:intl/intl.dart';
import '../widgets/restaurant.dart';
import '../widgets/commentSection.dart';


import 'package:flutter_localizations/flutter_localizations.dart';

class LoginScreen extends StatelessWidget {
  String myuserName="";
  final String _passwordUser1= "123";
  final String _passwordAdmin1 = "987654321";
  final String userNameAdmin ="Admin";
  final String userName = "or";
  final  Function succsseful_login_navigator;

  LoginScreen(this.succsseful_login_navigator);

  final passWordController = TextEditingController();
  final userController = TextEditingController();

  
    void _onSaved(context){
      final enteredUser = userController.text;
      final password = passWordController.text;
      print(password== _passwordUser1 );
      
      print(userNameAdmin== enteredUser);
      if(password== _passwordUser1 && userName== enteredUser){
        succsseful_login_navigator(context);
      }
      else{
        print("what?");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[  
                SizedBox(
                  height: 11.0,
                ),
                ClipRRect( 
                  child: Padding(padding: EdgeInsets.only(left: 40.0) ,child: Center(child: Container(height: 300, width: 300,child: Image.asset("assets/imgs/logo.jpeg")))),
                  borderRadius: BorderRadius.circular(50.0),
                ),
 
                Container(
                  height: 100,
                  // padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "ברוך הבא!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      )
                    ],
                  ),
                 
                ),
                new TextFormField(
                  controller: userController,
                  decoration: const InputDecoration(
                      labelText: 'שם משתמש',
                      icon: const Padding(
                          padding: const EdgeInsets.only(top: 15.0),
                          )),
                ),
                new TextFormField(
                  controller: passWordController,
                      decoration: const InputDecoration(
                          labelText: 'סיסמה',
                          icon: const Padding(
                              padding: const EdgeInsets.only(top: 15.0),)),
                              // onSaved: (val) => _password = val,
                              // validator: (val) => val.length !=7 ? 'Password too short.' : null,
                    ),
                SizedBox(height: 15.0),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 9, horizontal: 13),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9.0),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 5),
                          color: Colors.grey[100]),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FlatButton(
                        color: Colors.blueGrey,
                        child: Text('התחבר'),
                          textColor: Colors.black,
                          onPressed: ()=>_onSaved(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}