import 'package:flutter/material.dart';
import 'package:newsappflutter/generated/Screens/homescreen.dart';
import 'package:newsappflutter/generated/Screens/registerscreen.dart';
import 'package:newsappflutter/generated/reusablewidgets/reusablewidgets.dart';
import 'package:newsappflutter/generated/reusablewidgets/reuseableheading.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

          headingtext1(text: 'Login Page', size: 24),

          Container(
            width: 100,
            child: const Divider(
              color: Colors.black26,
              thickness: 1,
            ),
          ),

          headingtext4(text: 'Good to see you again, Login to fetch Movies !', size: 12),

          const SizedBox(
            height: 20,
          ),

          ReusableTextField(
            label: 'Enter Your Email Here',
            hint: 'abc@gmail.com',
            obsecure: false,
            icon: Icons.email_outlined,
          ),

          ReusableTextField(
            label: 'Enter Your Password Here',
            hint: '*********',
            obsecure: true,
            icon: Icons.key_sharp,
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const home()));
              });
            },
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: headingtext2(text: 'Login', size: 14,)),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headingtext4(text: 'Don'+''+'t Have an Account?',size: 12 ,),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const register()));
                    });
                  },
                  child: headingtext4(text: 'Register Here',size: 12 ,)),
            ],
          )
        ],
      ),
    );
  }
}


