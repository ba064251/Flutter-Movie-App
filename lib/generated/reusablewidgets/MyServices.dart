import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Apilist{

 static Future<dynamic> gettvshowresponse(page) async{
   var request = http.Request('GET', Uri.parse('https://www.episodate.com/api/most-popular?page=${page}'));
   http.StreamedResponse response = await request.send();
   if (response.statusCode == 200) {
     var res = await response.stream.bytesToString();
     return res;
   }
   else {
   print(response.reasonPhrase);
   return 0;
   }
 }

 static Future<dynamic> gettvshowdescription(id) async{
   var request = http.Request('GET', Uri.parse('https://www.episodate.com/api/show-details?q=${id}'));
   http.StreamedResponse response = await request.send();
   if (response.statusCode == 200) {
     var res = await response.stream.bytesToString();
     return res;
   }
   else {
     print(response.reasonPhrase);
     return 0;
   }
 }

}
