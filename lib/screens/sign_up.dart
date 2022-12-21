import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Sign_up extends StatefulWidget {
  const Sign_up({super.key});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
  bool? check1 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              const FaIcon(
                FontAwesomeIcons.person,
                size: 50,
              ),
              SizedBox(
                width: 50,
              ),
              Text(
                'SIGN UP!',
                style: GoogleFonts.kufam(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.email),
                  title: TextFormField(
                    // controller: passwordController,

                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'Email',
                    ),
                    onSaved: (String? value) {
                      // This optional block of code can be used to run
                      // code when the user saves the form.
                    },
                    validator: (String? value) {
                      return (value != null && value.contains('@'))
                          ? 'Do not use the @ char.'
                          : null;
                    },
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: TextFormField(
                    // controller: passwordController,
                    //obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Username',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.date_range),
                  title: TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'DD-MM-YYYY',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  title: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      icon: Icon(Icons.password_outlined),
                      border: InputBorder.none,
                      hintText: 'Password',
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20.0)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: ListTile(
                  leading: Icon(Icons.password_sharp),
                  title: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm Password',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: 50,),
              Checkbox(
                  //only check box
                  value: check1, //unchecked
                  onChanged: (bool? value) {
                    //value returned when checkbox is clicked
                    setState(() {
                      check1 = value;
                    });
                  }),
                  Text("I have read the"),
                  Text("Terms And Condition",
                  style:TextStyle(color: Colors.blueAccent),),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Already a member? '),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/');
                  },
                  child: const Text(' Sign In'),
                  style: ElevatedButton.styleFrom(
                    elevation: 40,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                    //   style: TextStyle(
                    //       color: Colors.blue, fontWeight: FontWeight.bold),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ]),
      )),
    );
  }
}
