import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:newsappflutter/generated/reusablewidgets/MyServices.dart';
import 'package:newsappflutter/generated/reusablewidgets/reusablewidgets.dart';
import 'package:newsappflutter/generated/reusablewidgets/reuseableheading.dart';
import 'package:carousel_slider/carousel_slider.dart';

class description extends StatefulWidget {


  int? id;

  description(this.id);

  @override
  State<description> createState() => _descriptionState(id: id!);
}

class _descriptionState extends State<description> {

  int id;
  _descriptionState({required this.id});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: SafeArea(
        top: true,
        child: FutureBuilder(
          future: Apilist.gettvshowdescription(id),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

            if (snapshot.connectionState==ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Text("Error While Fetching Decription");
            }
            if (snapshot.hasData) {

              Map map = jsonDecode(snapshot.data);

              double rating = double.parse(map["tvShow"]["rating"])/2;
              return ListView.builder(
                itemCount: map.length,
                itemBuilder: (context, index) {
                return reusabledescriptionwidget(
                  name: '${map["tvShow"]["name"]}',
                  rdate: '${map["tvShow"]["start_date"]}',
                  rating: rating,
                  network: '${map["tvShow"]["network"]}',
                  desc: '${map["tvShow"]["description"]}',
                  source: '${map["tvShow"]["description_source"]}',
                  img: '${map["tvShow"]["image_path"]}',);
              },);
            }

            return Container();
          },),
      ),
    );
  }
}


