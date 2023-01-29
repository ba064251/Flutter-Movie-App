import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:newsappflutter/generated/reusablewidgets/reuseableheading.dart';

import '../Screens/descriptionscreen.dart';

class dividerlineblack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      margin: EdgeInsets.only(left:24,top: 0),
      child: Divider(
        color: Colors.black,
        thickness: 1,
      ),
    );
  }
}

class dividerlinewhite extends StatelessWidget {

  double size;
  dividerlinewhite({required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      margin: EdgeInsets.only(left:30,top: 0),
      child: Divider(
        color: Colors.white,
        thickness: 1,
      ),
    );
  }
}

class ReusableTextField extends StatelessWidget {
  String label;
  String hint;
  bool obsecure;
  IconData icon;

  ReusableTextField({required this.label, required this.hint, required this.obsecure, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10,horizontal: 40),
      child: TextField(
        obscureText: obsecure,
        decoration:InputDecoration(
          prefixIcon: Icon(icon),
          label: headingtext4(text: label, size: 14,),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Color(0xf000000),width: 10,style: BorderStyle.solid)
          ),
        ),
      ),
    );
  }
}

// Home Screen List Widget //

class reusablehomescreenlist extends StatelessWidget {

  String name;
  String image;
  int id;

  reusablehomescreenlist({required this.name, required this.image, required this.id});
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[

          //News Image Container //
          Container(
            width: double.infinity,
            height: 350,

            margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover
                ),
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey
            ),
          ),

          //News Title along with show details button
          //News Name OR TiTle OR Author Name
          Container(
            width:150,
            margin: EdgeInsets.only(top:300,left: 26),
            child:headingtext2(text: name, size: 14,) ,
          ),

          //Show Details tappable text
          GestureDetector(
            onTap: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(name)));
              Navigator.push(context, MaterialPageRoute(builder: (context) => description(id),));
            },
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top:300,left: 240),
                  width: 90,
                  height:24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white
                  ),
                  child: Center(child: headingtext4(text: 'Show Details', size: 12,)),
                ),

                Container(
                  margin: EdgeInsets.only(left: 240),
                  child: dividerlinewhite(
                      size: 40
                  ),
                ),
              ],
            ),
          ),
        ]
    );
  }
}

// Description List Widget //

class reusabledescriptionwidget extends StatelessWidget {

  String name;
  String rdate;
  double rating;
  String network;
  String desc;
  String source;
  String img;


  reusabledescriptionwidget(
      {required this.name,
      required this.rdate,
      required this.rating,
      required this.network,
      required this.desc,
      required this.source,
      required this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Stack Containing Image and All neccessary descriptions //

        Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Container(
              width: 240,
              margin: EdgeInsets.only(left: 30,top: 170),
              child: headingtext2(text: name,size: 18,),
            ),

            Container(
              margin: EdgeInsets.only(top: 200),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                width: double.infinity,
                height: 500,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: Offset(0, -4),
                      ),
                    ],
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(20)),
              ),
            ),

            // Main Heading of Release Date, Rating and Network //

            Container(
              margin: EdgeInsets.only(top: 250),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        headingtext1(text: 'Release Date', size: 12),
                        headingtext1(text: 'Rating', size: 12),
                        headingtext1(text: 'Network', size: 12),
                      ],
                    ),
                  ),

                  Container(
                    width: 350,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        headingtext4(text: rdate, size: 12),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: RatingBarIndicator(
                            rating: rating,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: Colors.amber[300],
                            ),
                            itemCount: 5,
                            itemSize: 8.0,
                            direction: Axis.horizontal,
                          ),
                        ),
                        headingtext4(text: network, size: 12),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // Description Fetch //
                  Column(
                    children: <Widget>[
                      headingtext1(text: 'Description', size: 14),
                      Container(
                        margin: EdgeInsets.only(right: 21),
                        child: dividerlineblack(),
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 0,horizontal: 40),
                        width: 400,
                        height: 280,
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: headingtext5(
                                  text: desc,
                                  size: 12,),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10,horizontal: 30),
                    width: 350,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: headingtext1(
                          text: source,
                          size: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}





