import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class headingtext1 extends StatelessWidget {
  String text;
  double size;
  headingtext1({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.black,
          overflow: TextOverflow.ellipsis,
          fontStyle: FontStyle.normal,
          fontSize: size,
          letterSpacing: 0
      ),
    ),);
  }
}

class headingtext2 extends StatelessWidget {
  String text;
  double size;
  headingtext2({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.white,
          overflow: TextOverflow.fade,
          fontStyle: FontStyle.normal,
          fontSize: size,
          letterSpacing: 0,
          shadows: [
          Shadow(
          color: Colors.black
      )
      ],
      ),
    ),);
  }
}

class headingtext3 extends StatelessWidget {
  String text;
  double size;
  headingtext3({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.white,
        overflow: TextOverflow.ellipsis,
        fontStyle: FontStyle.normal,
        fontSize: size,
        letterSpacing: 0,
        shadows: [
          Shadow(
              color: Colors.black
          )
        ],
      ),
    ),);
  }
}

class headingtext4 extends StatelessWidget {
  String text;
  double size;
  headingtext4({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        overflow: TextOverflow.ellipsis,
        fontStyle: FontStyle.normal,
        fontSize: size,
        letterSpacing: 0,
        shadows: [
          Shadow(
              color: Colors.black
          )
        ],
      ),
    ),);
  }
}

class headingtext5 extends StatelessWidget {
  String text;
  double size;
  headingtext5({required this.text, required this.size});
  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.poppins(
      textStyle: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontSize: size,
        letterSpacing: 0,
        shadows: [
          Shadow(
              color: Colors.black
          )
        ],
      ),
    ),
    textAlign: TextAlign.justify,);
  }
}