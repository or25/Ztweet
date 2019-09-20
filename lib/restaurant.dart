import 'package:flutter/material.dart';
import 'package:restaurant_booking/starDisplay.dart';
import 'package:intl/intl.dart';
import './main.dart';
import './newComment.dart';

class RestaurantPage extends StatefulWidget {
  int id;
  List list;
  Map<String, int> hearts;
  List<int> stars;
  List<String> hebList;
  Map<String,String> minimap2;
  List<String> allComments;
  RestaurantPage(this.id, this.list, this.hearts, this.stars,this.hebList,this.minimap2,this.allComments);

  @override
  _RestaurantPageState createState() =>
      _RestaurantPageState(this.id, this.list, this.hearts, this.stars,this.hebList,this.minimap2,this.allComments);
}

class _RestaurantPageState extends State<RestaurantPage> {
  List<String> myComments = [];
  Map<String,String> minimap3 = { "Ugmar 80": "assets/imgs/ogmar2.jpeg",
    "Pipel's food": "assets/imgs/pilpel1.jpeg",
    "Bahadim City":"assets/imgs/bahadim2.png",
    "Gideonim": "assets/imgs/gideonim1.jpeg"};
  Map<String,String> minimap4={ "Ugmar 80": "assets/imgs/ogmar3.jpeg",
    "Pipel's food": "assets/imgs/pilpel2.jpeg",
    "Bahadim City":"assets/imgs/bahadim3.jpeg",
    "Gideonim": "assets/imgs/gideonim2.jpeg"};
  Map<String,String> minimap5= { "Ugmar 80": "assets/imgs/ogmar4.jpeg",
    "Pipel's food": "assets/imgs/pilpel3.jpeg",
    "Bahadim City":"assets/imgs/bahadim4.png",
    "Gideonim": "assets/imgs/gideonim1.jpeg"};
  int id;
  List list;
  Map<String, int> hearts;
  List<int> stars;
  bool bool1=true;
  List<String> hebList;
  Map<String,String> minimap2;
  List<String> allComments;
  _RestaurantPageState(this.id, this.list, this.hearts, this.stars,this.hebList,this.minimap2,this.allComments);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              
              height: MediaQuery.of(context).size.height / 1.9,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(id!=2?minimap2[list[id]]:"assets/imgs/bahadim.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      InkWell(
                          child: RoundButtonNew(icon: Icons.arrow_back_ios)),
                      Spacer(),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white30,
                        ),
                        padding: EdgeInsets.all(5.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if(bool1){
                                  widget.hearts[widget.list[widget.id]]++;
                                bool1= false;
                            }
                            else{}                          
                          },
                        ),
                        height: 50,
                        width: 50,
                      ),
                      // RoundButtonHeart(icon: Icons.favorite_border),
                      SizedBox(width: 5.0),
                      RoundButton(icon: Icons.ac_unit),
                    ],
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 51),
                  //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  //   decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(21),
                  //   ),
                  //   child: Text(
                  //     "\$125",
                  //     style:
                  //         TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                  //   ),
                  // ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.all(25),
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.pin_drop,
                          color: Colors.grey[400],
                        ),
                        Text(
                          "3KM Until Arrival",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      this.hebList[id],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
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
                          width: 11,
                        ),
                        Text(
                          "5.0",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        StarDisplay(
                          value: stars[this.id],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 11,
                    ),
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/imgs/profile.jpg'),
                        ),
                        SizedBox(width: 11),
                        Text(
                          "Israel Israeli",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(width: 21),
                        Text(
                          "22:30",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        Spacer(),
                        Icon(
                          Icons.favorite,
                          color: Colors.pink,
                        ),
                        SizedBox(width: 5),
                        Text(
                          widget.hearts[widget.list[widget.id]] == null
                              ? "0"
                              : widget.hearts[widget.list[widget.id]]
                                  .toString(),
                          style: TextStyle(color: Colors.pink),
                        ),
                        SizedBox(width: 11),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      CommentSection(myComments,id)),
                            );
                          },
                          
                                                      child: Icon(
                              Icons.comment,
                              color: Colors.grey,
                            ),
                          ),
                        
                        SizedBox(width: 5),
                        Text(
                          myComments.length.toString(),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Container(
                      height: 65,
                      margin:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 21),
                      padding: EdgeInsets.all(15),
                      color: Color(0xfff7f8fc),
                      child: Row(
                        children: <Widget>[
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset(id!=2?minimap3[list[id]]:"assets/imgs/bahadim2.png"),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset(id!=2?minimap4[list[id]]:"assets/imgs/bahadim3.jpeg"),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Flexible(
                            child: ClipRRect(
                              child: Image.asset(id!=2?minimap5[list[id]]:"assets/imgs/bahadim4.png"),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          )
                        ],
                      ),
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [Colors.yellow, Colors.orange],
                            ),
                            boxShadow: [
                              BoxShadow(blurRadius: 5.0, color: Colors.orange)
                            ]),
                        child: Row(
                          children: <Widget>[
                            Spacer(),
                            InkWell(
                              onTap: (){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NewTransaction(myComments,allComments)),
                                );
                              },
                                                          child: Text(
                                "הוספת תגובה ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                            Spacer(),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundButton extends StatelessWidget {
  final IconData icon;

  const RoundButton({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: () {
          print("hello");
        },
      ),
      height: 50,
      width: 50,
    );
  }
}

class RoundButtonNew extends StatelessWidget {
  final IconData icon;

  const RoundButtonNew({Key key, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white30,
      ),
      padding: EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      height: 50,
      width: 50,
    );
  }
}

class CommentSection extends StatelessWidget {
  int id;
  final List<String> myList;
  CommentSection(this.myList,this.id);
  @override
  Widget build(BuildContext context) {
    // return Text("hello");
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: myList!=null || myList[id]=="Bahadim City"? myList
            .map(
              (data) => ListTile(
                  leading: Icon(Icons.comment),
                  title: Text(DateFormat('kk:mm:ss \t EEE d MMM')
                      .format(new DateTime.now())
                      .toString()),
                  subtitle: Text(data)),
            )
            .toList() : [Text('You Haven\'t entered any input yet!')],
      ),
    );
  }
}

class CommentForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}