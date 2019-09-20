import 'package:flutter/material.dart';
import 'package:restaurant_booking/restaurant.dart';
import 'package:restaurant_booking/starDisplay.dart';
import 'package:intl/intl.dart';
import './restaurant.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());
List<String> allCommentsList= new List<String>();
String myuserName="";
List<String> buttonsTitle = [
  "South",
  "North",
  "Central",
  "Recommended",
  "Disgusting"
];
List<String> restaurantList = [
  "American Restaurant",
  "Turkish Restaurant",
  "Indian Restaurant",
  "Japanese Restaurant"
];

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     localizationsDelegates: [
   // ... app-specific localization delegate[s] here
   GlobalMaterialLocalizations.delegate,
   GlobalWidgetsLocalizations.delegate,

 ],
 supportedLocales: [
    const Locale('en'), // English
    const Locale('he'), // Hebrew
    // const Locale('zh'), // Chinese
    // ... other locales the app supports
  ],
  locale: Locale("he", "IR") ,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          fontFamily: 'Montserrat',
        ),
        home: Home1() //RestaurantPage(),
        );
  }
}

class Home extends StatelessWidget {
  static int count1 = 0;
  static int count2 = 0;
  static int count3 = 0;
  static int count4 = 0;

  Map<String, Image> minimap = {
    "Ugmar 80": Image.asset("assets/imgs/ogmar1.jpeg"),
    "Pipel's food": Image.asset("assets/imgs/pilpel1.jpeg"),
    "Bahadim City": Image.asset("assets/imgs/bahadim.jpeg"),
    "Gideonim": Image.asset("assets/imgs/gideonim1.jpeg")
  };
  Map<String,String> minimap2 = {

  "Ugmar 80": "assets/imgs/ogmar1.jpeg",
    "Pipel's food": "assets/imgs/pilpel1.jpeg",
    "Bahadim City":"assets/imgs/bahadim.jpeg",
    "Gideonim": "assets/imgs/gideonim1.jpeg"
  };
  Map<String, int> base_to_hearts = {
    "Ugmar 80": count1,
    "Pipel's food": count2,
    "Bahadim City": count3,
    "Gideonim": count4
  };
  List names_of_bases = [
    "Ugmar 80",
    "Pipel's food",
    "Yir A'bahadim",
    "Gideonim"
  ];
  List<String> mylikes = [];
  // Map<String,int> base_to_stars= {"Ugmar 80": 2,  "Pipel's food":5,
  // "Bahadim City": 2,
  // "Gideonim": 1};
  List<int> base_to_stars = [5, 4, 2, 4];
  List<String> hebList = ["אוגמר 80", "המטבח של פלפל", "עיר הבהדים", " גדעונים"] ;
  final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            InkWell(
              onTap: () {
                print("hi");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPersonalPage(allCommentsList)),
                );
              },
              child: IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () {
                print("hi");
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyPersonalPage(allCommentsList)),
                );
              },
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text( "היי,  "+myuserName +". ברוך השב!     ",
                              style: TextStyle(  fontWeight: FontWeight.bold,),),
                              Text( 
                              DateFormat(' EEE d MMM  ').format(DateTime.now()),)
                            ],
                          ),
                          Text(
                            " חיכינו לשמוע את חוות דעתך!",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/imgs/profile.jpg"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 11.0,
                ),
                TextField(
                  controller: myController,
                  decoration: InputDecoration(
                    hintText: "Search for a dish",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 275,
                  child: ListView.builder(
                    // names_of_bases.map((element)=>{
                    //   return LargeContainer(element);
                    // }).toList(),
                    itemCount: minimap.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, id) {
                      print(id);
                      return LargeContainer(
                          id, names_of_bases, base_to_stars, base_to_hearts,hebList,minimap2);
                    },
                  ),
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          gradient: LinearGradient(
                              colors: [Colors.orangeAccent, Colors.pinkAccent]),
                        ),
                        child: Text(
                          "חדש",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        "בסיס פלמחים",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 55,
                  child: ListView.builder(
                    itemCount: buttonsTitle.length,
                    itemBuilder: (BuildContext context, int id) {
                      return MyCustomButton(
                        title: buttonsTitle[id],
                        active: id == 0 ? true : false,
                      );
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 181,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurantList.length,
                    itemBuilder: (context, id) {
                      return SmallContainer(text: restaurantList[id]);
                    },
                  ),
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LargeContainer extends StatelessWidget {
  int id;
  List myList;
  List base_to_stars;
  List<String> hebList;
  Map<String, int> hearts;
  Map<String,String> minimap2;
  LargeContainer(this.id, this.myList, this.base_to_stars, this.hearts,this.hebList,this.minimap2);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            blurRadius: 5.0,
            offset: Offset(0, 3),
            color: Colors.grey[300],
          ),
        ],
      ),
      padding: EdgeInsets.all(15.0),
      margin: EdgeInsets.symmetric(horizontal: 9.0, vertical: 7.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        RestaurantPage(id, myList, hearts, base_to_stars,hebList,minimap2,allCommentsList)),
              );
            },
            child: ClipRRect(
              
              child: Image.asset(id!=2?minimap2[myList[id]]:"assets/imgs/bahadim.jpeg", height: 150, width: 200),
              borderRadius: BorderRadius.circular(15.0),
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Text(
            hebList[id],
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 19.0,
            ),
          ),
          SizedBox(
            height: 9.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.pin_drop,
                color: Colors.grey[400],
              ),
              Text(
                "3KM Until Arrival",
                style: TextStyle(
                  color: Colors.grey[400],
                ),
              ),
              Spacer(),
              Flexible(
                flex: 3,
                child: FittedBox(
                  child: StarDisplay(
                    value: base_to_stars[id],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class SmallContainer extends StatelessWidget {
  final String text;
  const SmallContainer({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 179,
          width: MediaQuery.of(context).size.width / 2.5,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          padding: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                blurRadius: 5.0,
                offset: Offset(0, 3),
                color: Colors.grey[300],
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                child: Image.asset("assets/imgs/meat.jpg"),
                borderRadius: BorderRadius.circular(15.0),
              ),
              SizedBox(
                height: 9.0,
              ),
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(
                height: 9.0,
              ),
              Row(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    width: 15,
                    height: 15,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "5.0",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  Icon(
                    Icons.favorite,
                    color: Colors.grey[400],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  final bool active;
  final String title;
  const MyCustomButton({Key key, this.active, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 115,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: !active ? Border.all(color: Colors.grey[100]) : null,
            borderRadius: BorderRadius.circular(21.0),
            gradient: active
                ? LinearGradient(colors: [Colors.yellow, Colors.orange])
                : null,
            color: active ? null : Colors.white,
            boxShadow: [
              active
                  ? BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 3),
                      blurRadius: 5.0,
                    )
                  : BoxShadow()
            ],
          ),
          padding: EdgeInsets.symmetric(horizontal: 21.0, vertical: 5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 7.0),
          child: Text(
            title,
            style: TextStyle(color: active ? Colors.white : Colors.grey[500]),
          ),
        ),
      ),
    );
  }
}

class MyPersonalPage extends StatelessWidget {
  List<String> allcommentString;
  MyPersonalPage(this.allcommentString);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: CommentSection(allCommentsList==null?['empty']:allCommentsList,0)
    ));
  }
}
class Home1 extends StatelessWidget {

  String _passwordUser1= "123456789";
  String _passwordAdmin1 = "987654321";
  String userNameAdmin ="Admin";
  String userName = "5772705";

  final passWordController = TextEditingController();
  final userController = TextEditingController();

  
    void _onSaved(context){
      final enteredUser = userController.text;
      final password = passWordController.text;
      print(password== _passwordUser1 );
      
      print(userNameAdmin== enteredUser);
      if(password== _passwordUser1 && userName== enteredUser){
        print("success Login!!"); 
        myuserName= userName;
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Home()),
        );
      }
      else{
        print("what?");
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 7.0,
        child: new Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline),
              onPressed: () {},
            ),
          ],
        ),
      ),
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
                ClipRRect( //Replace with logo]
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
                        "התחברות",
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