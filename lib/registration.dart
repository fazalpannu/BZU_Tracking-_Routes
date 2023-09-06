import 'package:bzu_online_route_tracking_app/dashboard.dart';
import 'package:bzu_online_route_tracking_app/login.dart';
import 'package:bzu_online_route_tracking_app/utils/utils.dart';
import 'package:bzu_online_route_tracking_app/widget/buttton.dart';
import 'package:bzu_online_route_tracking_app/widget/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _desigController = TextEditingController();
  final TextEditingController _enrollController = TextEditingController();
  final TextEditingController _stdidController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                child: Image.asset('img/buses.png'),
              ),
            ),

            SizedBox(
              height: screenHeight * 0.015,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "Hello! Register to get started",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.015,
            ), //username
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _nameController,
                labelText: 'Name',
                icon: Icons.person,
                isObscure: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ), //email
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: 'email',
                icon: Icons.email,
                isObscure: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ), //password
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.password,
                isObscure: true,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ), //confirm password
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _desigController,
                labelText: 'Designation',
                icon: Icons.offline_bolt,
                isObscure: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            //register button
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _stdidController,
                labelText: 'Student ID',
                icon: Icons.perm_identity,
                isObscure: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.005,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _enrollController,
                labelText: 'Enrollment',
                icon: Icons.rotate_90_degrees_ccw,
                isObscure: false,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.025,
            ),
            Center(
                child: button(
                    ontap: () {
                      auth
                          .createUserWithEmailAndPassword(
                              email: _emailController.text.toString(),
                              password: _passwordController.text.toString())
                          .then((value) {
                        utils().toast('Sign Up Successfully!');
                      }).onError((error, stackTrace) {
                        utils().toast(error.toString());
                      });
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => MyHomePage()));
                    },
                    txt: '         Register         ')),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        decoration: TextDecoration.underline,
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
