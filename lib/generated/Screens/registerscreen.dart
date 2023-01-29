import 'package:flutter/material.dart';
import 'package:newsappflutter/generated/Screens/homescreen.dart';
import 'package:newsappflutter/generated/Screens/loginscreen.dart';
import 'package:newsappflutter/generated/reusablewidgets/reusablewidgets.dart';
import 'package:newsappflutter/generated/reusablewidgets/reuseableheading.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f6fd),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

         headingtext1(text: 'Registration Page', size: 24),

          Container(
            width: 100,
            child: const Divider(
              color: Colors.black26,
              thickness: 1,
            ),
          ),

          Container(
              margin: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: headingtext4(text: 'Register Yourself for Free and explore Movies !', size: 12)),

          const SizedBox(
            height: 20,
          ),

          ReusableTextField(
            label: 'Enter Your Name Here',
            hint: 'John Doe',
            obsecure: false,
            icon: Icons.person,
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => const login()));
              });
            },
            child: Container(
              width: 100,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.green[300],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(child: headingtext2(text: 'Register', size: 14,)),
            ),
          ),

          SizedBox(
            height: 10,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              headingtext4(text: 'Already Have an Account?',size: 12 ,),
              SizedBox(
                width: 4,
              ),
              GestureDetector(
                  onTap: (){
                    setState(() {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const login()));
                    });
                  },
                  child: headingtext4(text: 'Login Here',size: 12 ,)),
            ],
          )
        ],
      ),
    );
  }
}


