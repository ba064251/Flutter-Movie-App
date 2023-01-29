import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsappflutter/generated/Screens/descriptionscreen.dart';
import 'package:newsappflutter/generated/Screens/loginscreen.dart';
import 'package:newsappflutter/generated/reusablewidgets/MyServices.dart';
import 'package:newsappflutter/generated/reusablewidgets/reusablewidgets.dart';
import 'package:newsappflutter/generated/reusablewidgets/reuseableheading.dart';

class home extends StatefulWidget {

  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {

  int page = 1;

  void _pageshifter()
  {
    page++;
  }

  void _pageshifter2()
  {
    page--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: GestureDetector(
        onTap: (){
          setState(() {
            if (page>1) {
              _pageshifter2();
            }
            else(
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already on First Page")))
            );
          });
        },
        child: SafeArea(
          top: true,
          child: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                //Main Heading
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:20,top: 20),
                      child: GestureDetector(
                        onTap: (){
                          setState(() {
                            _pageshifter();
                          });
                        },
                        child: Slidable(
                          startActionPane:ActionPane(
                            motion:StretchMotion(),
                            children: [
                              SlidableAction(onPressed: ((context) {
                                Navigator.of(context).setState(() {
                                  _pageshifter();
                                });
                              }),
                                flex: 1,
                                autoClose: true,
                                icon: Icons.add,
                                backgroundColor: Color(0xff8cff92),
                                foregroundColor: Colors.white,
                                label: "Next Page",
                              ),
                            ],
                          ) ,
                          endActionPane: ActionPane(
                            motion: StretchMotion(),
                            children: [
                              SlidableAction(onPressed: ((context) {
                                Navigator.of(context).setState(() {
                                  if (page>1) {
                                    _pageshifter2();
                                  }
                                  else(ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Already on First Page"))));
                                });
                              }),
                              flex: 1,
                              autoClose: true,
                              icon: Icons.minimize,
                                backgroundColor: Color(0xffff6464),
                                foregroundColor: Colors.white,
                                label: "Previous Page",
                              ),
                            ],
                          ),
                          child: headingtext1(
                              text: "Movie Star App",
                              size: 22
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:4,top: 14),
                      child: headingtext1(
                          text: page.toString(),
                          size: 12
                      ),
                    ),
                  ],
                ),

                //Divider Line For Looks

                dividerlineblack(),
                //Stack having Image and Text Container
                FutureBuilder(
                  future: Apilist.gettvshowresponse(page),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }

                    if(snapshot.hasError){
                      return Text("Error While Fetching Movies");
                    }

                    if (snapshot.hasData) {

                      Map map = jsonDecode(snapshot.data);
                      List names = map["tv_shows"];
                      print(map);

                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount:names.length,
                        physics: const ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          return reusablehomescreenlist(
                              name: '${names[index]["name"]}',
                              image: '${names[index]["image_thumbnail_path"]}',
                              id: names[index]["id"],
                          );
                        },
                      );
                    }
                    return Container();
                  },
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}

